# Misc shared aliases amongst platforms
alias cls='clear'
#alias reload='source ~/.bashrc'
alias cv='vim ~/.vimrc'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias reload='source ~/.zshrc'
alias showcolors='for code in {000..255}; do print -P -- "$code: %F{$code}Test%f"; done'
alias showboldcolors='for i in {0..255}; do echo -e "\e[38;05;${i}m${i}"; done | column -c 80 -s "  "; echo -e "\e[m"'
alias showallcolors='for code in $(seq -w 0 255); do for attr in 0 1; do printf "%s-%03s %bTest%b\n" "${attr}" "${code}" "\e[${attr};38;05;${code}m" "\e[m"; done; done | column -c $((COLUMNS*2))'
alias server='python -m SimpleHTTPServer'

alias coffeed='coffee --nodejs --debug'
