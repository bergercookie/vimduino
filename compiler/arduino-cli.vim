if exists("current_compiler")
    finish
endif
let current_compiler = "arduino-cli"

" Check prerequisites
if ! executable("arduino-cli")
    echoerr "Arduino-cli doesn't exist in user $PATH. Please install for `make` to work"
endif

if empty($ARDUINO_ARCH)
    echoerr "ARDUINO_ARCH environment variable is empty! Please set it otherwise `Make` will not work for arduino projects"
endif

setlocal makeprg=arduino-cli\ compile\ --fqbn\ $ARDUINO_ARCH\ %:p:h
setlocal errorformat=%f:%l:%c:\ error:\ %m


function! UploadSketch(tty)
    if &runtimepath !~# 'vim-dispatch'
        echoerr "I need vim-dispatch to run UploadSketch. Please install it first"
        return
    endif

    let l:cmd = 'arduino-cli upload -p ' . a:tty .
                \ ' --fqbn ' . $ARDUINO_ARCH . ' ' .
                \ expand('%:p:h')
        execute "Dispatch " . cmd
endfunction
command! -nargs=1 UploadSketch :call UploadSketch(<q-args>)

function! MonitorSerial(tty, ...)
    if &runtimepath !~# 'vim-dispatch'
        echoerr "I need vim-dispatch to run MonitorSerial. Please install it first."
        return
    endif

    if !executable("picocom")
        echoerr "I need picocom to run MonitorSerial. Please install it first."
        return
    endif

    " baud rate
    if len(a:000) ==# 0
        let l:baud = g:vimduino_serial_baud_rate
    else
        let l:expr = a:1
    endif

    let l:cmd = "picocom -b " . l:baud . " " . a:tty
    execute "Dispatch " . cmd
endfunction
command! -nargs=? MonitorSerial :call MonitorSerial(<q-args>)
