function git_hash() {
  echo `git rev-parse --short HEAD 2> /dev/null`
}

function ruby_flags() {
  echo "Setting ruby HEAP and GC flags."
  export RUBY_HEAP_MIN_SLOTS=800000
  export RUBY_HEAP_FREE_MIN=100000
  export RUBY_HEAP_SLOTS_INCREMENT=300000
  export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
  export RUBY_GC_MALLOC_LIMIT=79000000
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


function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}
