if exists("current_compiler")
    finish
endif
let current_compiler = "arduino-cli"

let s:upload_logfile = '/tmp/vimduino-cli-upload.log'

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
    execute ':split ' . s:upload_logfile . '<CR>'
    set readonly
    set autoread
    execute '!arduino-cli upload -p ' a:tty ' --fqbn ' . $ARDUINO_ARCH . expand('%:p:h') ' 1> ' . s:upload_logfile ' 2>&1'
endfunction
command! -nargs=1 UploadSketch :call UploadSketch('/dev/ttyUSB0')

