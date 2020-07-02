alias v='nvim'
alias vim='nvim'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias reload='source ~/.zshrc'

alias showcolors='for code in {000..255}; do print -P -- "$code: %F{$code}Test%f"; done'
alias showboldcolors='for i in {0..255}; do echo -e "\e[38;05;${i}m${i}"; done | column -c 80 -s "  "; echo -e "\e[m"'
alias showallcolors='for code in $(seq -w 0 255); do for attr in 0 1; do printf "%s-%03s %bTest%b\n" "${attr}" "${code}" "\e[${attr};38;05;${code}m" "\e[m"; done; done | column -c $((COLUMNS*2))'
alias server='python -m SimpleHTTPServer'

# Find process
alias fp='ps aux | grep'

# Kill process
alias kp='kill -9'

# Show octal permissions for a file
alias op='stat -c "%a %n"'

# Search history
alias r='history | grep'

# Start mongo
alias startmongo='sudo mongod --fork --logpath /var/log/mongodb/mongodb.log'

# Copy to clipboard. Example: cat somefile.txt | cb # Then ctrl+v elsewhere
alias cb='xclip -selection clipboard '

# Rails specific
alias tm='RAILS_ENV=test rake db:migrate'
alias tr='RAILS_ENV=test rake db:rollback'
alias t='spring rspec'

# Elixir/Phoenix
alias dp='iex -S mix phx.server'
alias d='iex -S mix'
alias p='mix phx.server'

# Helper to show language/framework specific aliases
alias arails='alias | egrep -i "ruby|rails|rake|spring|rspec"'
alias aphx='alias | egrep -i "mix|iex"'

alias notify="osascript -e 'display notification \"You are notified!\"'"
