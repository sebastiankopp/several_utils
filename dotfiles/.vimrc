:set ts=4
:set relativenumber

:syntax on
:filetype plugin on
:set omnifunc=syntaxcomplete

" When using vim as diff tool, the -ic flag seems to be problematic
if &diff == 'nodiff'
" Using autocompletion and shell aliases in Vim
    set shellcmdflag=-ic
endif
