# git autocomplete
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

## settings for better presenting branch name
function git_branch_name () {
  git branch 2>/dev/null | grep -e '^*' | sed -E 's/^\* (.+)$/(\1) /'
}

PS1="\[\033[01;32m\]\u@\h:\[\033[01;34m\]\w\[\033[1;35m\]\$(git_branch_name)\[\033[m\]$ "
