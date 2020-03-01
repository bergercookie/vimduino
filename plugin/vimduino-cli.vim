" vimduino-cli - Facilitate arduino development in Vim
" Maintainer: Nikos Koukis <http://bergercookie.github.io/>
" Version:    0.1

if exists('g:loaded_vimduino_cli') || &compatible
    finish
endif
let g:loaded_vimduino_cli = 1

" arduino configuration
let g:arduino_dir = $HOME . '/.arduino15/packages'
let g:arduino_tags_file = $HOME . '/.vim/arduino.tags'

" Check prerequisites
if !executable("ctags")
    echoerr "ctags doesn't exist in user $PATH. Please install for `make` to work"
endif

" generate ctags
function! GenerateArduinoTags()
    execute '!ctags -R --fields=+liaS --tag-relative -f ' . g:arduino_tags_file ' ' . g:arduino_dir
endfunction
command! GenerateArguinoTags silent! :call GenerateArduinoTags()

" load ctags for arduino
function! LoadArduinoTags()
    if !filereadable(g:arduino_tags_file)
        echom "Unable to load arduino tags! - [" . g:arduino_tags_file . "] doesn't exist"
        return
    endif

    if stridx(g:arduino_dir, &tags) == -1
        let &tags = &tags . ',' . g:arduino_tags_file
    endif
endfunction
command! LoadArduinoTags :call LoadArduinoTags()