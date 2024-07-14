" arduino configuration
let g:arduino_dir = $HOME . '/.arduino15/packages'
let g:arduino_tags_file = $HOME . '/.arduino.tags'

" Check prerequisites
if !executable("ctags")
    echoerr "ctags doesn't exist in user $PATH. Please install for `make` to work"
endif

" generate ctags
function! GenerateArduinoTags()
    execute '!ctags -R --fields=+liaS --tag-relative -f ' . g:arduino_tags_file ' ' . g:arduino_dir
endfunction
command! GenerateArguinoTags silent! :call GenerateArduinoTags()

" load tags file
function! LoadArduinoTags()
    if !filereadable(g:arduino_tags_file)
        echom "Unable to load arduino tags! - [" . g:arduino_tags_file . "] doesn't exist - Please generate the tags first using GenerateArduinoTags"
        return
    endif

    if stridx(g:arduino_dir, &tags) == -1
        let &tags = &tags . ',' . g:arduino_tags_file
    endif
endfunction
command! LoadArduinoTags :call LoadArduinoTags()

LoadArduinoTags
compiler arduino-cli
