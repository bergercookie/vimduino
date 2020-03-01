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
