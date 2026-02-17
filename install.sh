#!/bin/sh

set -e

linkfile(){
  echo "Linking files in $1 to $2"
  filename=$(basename $1)
  src="$(pwd)/$1"
  dest="$2/$filename"
  rm -f "$dest"
  ln -s "${src}" "${dest}"
}

linkfile_rename (){
  echo "Linking files in $1 to $2"
  filename=$(basename $1)
  src="$(pwd)/$1"
  dest="$2"
  rm -f "$dest"
  ln -s "${src}" "${dest}"
}

linkfiles(){
  mkdir -p "$2"
  find "$1" -type f | while read file; do linkfile $file $2; done
}

link_dotconfigs() {
  local SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/dot_config"
  local DEST_BASE="$HOME/.config"

  if [[ ! -d "$SRC_DIR" ]]; then
    echo "No dot_config directory found at $SRC_DIR"
    return 1
  fi

  find "$SRC_DIR" -type f | while read -r src_file; do
    # Strip the source prefix to get relative path (e.g. yazi/theme.toml)
    rel_path="${src_file#$SRC_DIR/}"

    # Destination full path (~/.config/yazi/theme.toml)
    dest_file="$DEST_BASE/$rel_path"
    dest_dir="$(dirname "$dest_file")"

    # Ensure destination directory exists
    mkdir -p "$dest_dir"

    # If already correct symlink → skip
    if [[ -L "$dest_file" && "$(readlink "$dest_file")" == "$src_file" ]]; then
      echo "✓ Already linked: $dest_file"
      continue
    fi

    # If file exists but not correct symlink → backup
    if [[ -e "$dest_file" && ! -L "$dest_file" ]]; then
      echo "⚠️  Backing up existing file: $dest_file → ${dest_file}.bak"
      #mv "$dest_file" "${dest_file}.bak"
    fi

    # Create symlink
    ln -sf "$src_file" "$dest_file"
    echo "→ Linked: $dest_file"
  done
}

#Create configs directory
mkdir -p "$HOME/configs"
mkdir -p "$HOME/.config/nvim/lua/pack-config"

linkfiles "home-files" "$HOME"
linkfiles "zsh" "$HOME"

#linkfiles "bins" "/usr/local/bin"
#linkfiles "nvim" "$HOME/.config/nvim"

# Link manually
linkfile "nvim/init.lua" "$HOME/.config/nvim"
linkfile "nvim/vars.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/opts.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/keys.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/pack.lua" "$HOME/.config/nvim/lua"
linkfile "nvim/cmds.lua" "$HOME/.config/nvim/lua"

link_dotconfigs

# Link all pack config files
linkfiles "nvim/pack-config" "$HOME/.config/nvim/lua/pack-config"
