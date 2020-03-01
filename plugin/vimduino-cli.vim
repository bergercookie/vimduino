" vimduino-cli - Facilitate arduino development in Vim
" Maintainer: Nikos Koukis <http://bergercookie.github.io/>
" Version:    0.1

if exists('g:loaded_vimduino_cli') || &compatible
    finish
endif
let g:loaded_vimduino_cli = 1

" default baud rate to communicate over serial with board
let g:vimduino_serial_baud_rate = 115200
