" vimduino - Enable arduino development in Vim
" Maintainer: Nikos Koukis <http://bergercookie.dev/>
" Version:    0.1

if exists('g:loaded_vimduino') || &compatible
    finish
endif
let g:loaded_vimduino = 1

" default baud rate to communicate over serial with board
let g:vimduino_serial_baud_rate = 115200
