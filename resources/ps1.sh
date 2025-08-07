function git_branch_name () {
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        echo "($branch) "
    fi
}

PS1="\[\033[38;5;4m\]\u@\h\[\033[0m\]:"
PS1=$PS1"\[\033[38;5;083m\]\w\[\033[0m\] "
PS1=$PS1"\[\033[38;5;122m\]\$(git_branch_name)\[\033[0m\]$ "

