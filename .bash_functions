function git_hash() {
  echo `git rev-parse --short HEAD 2> /dev/null`
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
