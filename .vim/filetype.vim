augroup filetypedetect
    au BufRead,BufNewFile *.c setfiletype c
    au BufRead,BufNewFile *.cpp setfiletype cpp
    au BufRead,BufNewFile *.py setfiletype python
    au BufRead,BufNewFile *.tex setfiletype tex
augroup END
