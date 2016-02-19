function git_hash() {
  echo `git rev-parse --short HEAD 2> /dev/null`
}

# cat for json files with pretty print
function jcat() {
  cat $1 | pjson
}

function ruby_flags() {
  echo "Setting ruby HEAP and GC flags."
  export RUBY_HEAP_MIN_SLOTS=800000
  export RUBY_HEAP_FREE_MIN=100000
  export RUBY_HEAP_SLOTS_INCREMENT=300000
  export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
  export RUBY_GC_MALLOC_LIMIT=79000000
}

function unset_ruby_flags() {
  echo "Unsetting ruby HEAP and GC flags."
  unset RUBY_HEAP_MIN_SLOTS
  unset RUBY_HEAP_FREE_MIN
  unset RUBY_HEAP_SLOTS_INCREMENT
  unset RUBY_HEAP_SLOTS_GROWTH_FACTOR
  unset RUBY_GC_MALLOC_LIMIT
}

function find_git_branch {
  local dir=. head
  until [ "$dir" -ef / ]; do
    if [ -f "$dir/.git/HEAD" ]; then
      head=$(< "$dir/.git/HEAD")
      if [[ $head == ref:\ refs/heads/* ]]; then
        git_branch="${head#*/*/}"
      elif [[ $head != '' ]]; then
        git_branch='(detached)'
      else
        git_branch='(unknown)'
      fi
      return
    fi
    dir="../$dir"
  done
  git_branch=''
}

function strip_diff_leading_symbols(){
  echo "STRIP 1"
  color_code_regex="(\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K])"
  reset_color="\x1B\[m"
  dim_magenta="\x1B\[38;05;146m"
  echo "STRIP 2"

  # simplify the unified patch diff header
  sed -r "s/^($color_code_regex)diff --git .*$//g" | \
  sed -r "s/^($color_code_regex)index .*$/\n\1$(rule)/g" | \
  sed -r "s/^($color_code_regex)\+\+\+(.*)$/\1+++\5\n\1$(rule)\x1B\[m/g" |\

  echo "STRIP 3"

  # extra color for @@ context line
  sed -r "s/@@$reset_color $reset_color(.*$)/@@ $dim_magenta\1/g"  |\

  echo "STRIP 4"
  # actually strips the leading symbols
  sed -r "s/^($color_code_regex)[\+\-]/\1 /g"

  echo "STRIP 5"
}

# Print a horizontal rule
rule () {
  # ORIGINAL
  #printf "%$(tput cols)s\n"|tr " " "─"}}
  printf "%$(tput cols)s\n"|tr " " "─"
}

function path(){
  old=$IFS
  IFS=:
  printf "%s\n" $PATH
  IFS=$old
}
