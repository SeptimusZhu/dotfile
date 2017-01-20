cdls() {
    cd "${1}";
    ls -alrt;
}
alias cd='cdls'
alias l='ls -al'
alias ..='cd ..'
alias ...='cd ..;cd ..'
export PS1='\u:\w> '
export CLICOLOR=1
