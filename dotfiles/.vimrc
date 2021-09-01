:set ts=4
:set relativenumber
:set expandtab

:syntax on
:filetype plugin on
:set omnifunc=syntaxcomplete

filetype plugin on
:set autoindent
:set smartindent
" When using vim as diff tool, the -ic flag seems to be problematic
"if &diff == 'nodiff'
" Using autocompletion and shell aliases in Vim
"    set shellcmdflag=-ic
"endif
