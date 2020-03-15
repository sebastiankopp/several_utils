# File to be put into $ZSH/custom
# Hist search backward: Page up
bindkey "${terminfo[kpp]}" history-search-backward
# Hist search forward: Page down
bindkey "${terminfo[knp]}" history-search-forward
# Convenience method to open multiple files
# with gui app at once
function xopen() {
	for i in $*
	do
		xdg-open $i
	done
}
