# vimduino - Enable arduino development in Vim

```
 __ __  ____  ___ ___  ___    __ __  ____  ____    ___
|  |  ||    ||   |   ||   \  |  |  ||    ||    \  /   \
|  |  | |  | | _   _ ||    \ |  |  | |  | |  _  ||     |
|  |  | |  | |  \_/  ||  D  ||  |  | |  | |  |  ||  O  |
|  :  | |  | |   |   ||     ||  :  | |  | |  |  ||     |
 \   /  |  | |   |   ||     ||     | |  | |  |  ||     |
  \_/  |____||___|___||_____| \__,_||____||__|__| \___/
```

Vim/Neovim plugin for facilitating arduino development in Vim - Makes use of the
latest [arduino-cli](https://github.com/arduino/arduino-cli) tool

## Why?

Most of the plugins for Arduino and/or vim either make use of Java or are
fiddling with mechanics of the Arduino IDE. This plugin instead builds around
well-known CLI tools such as `arduino-cli`, `picocom`, `ctags` to bring the
Arduino development experience to Vim.

## Functionality

- `:Make` / quickfix support using `arduino-cli`
- `:GenerateArduinoTags` / `:LoadArduinoTags`
- `:UploadSketch <path-to-dev>`
- `:MonitorSerial <path-to-dev>`

## Installation

### Dependencies

Install the following binary dependencies:

- `arduino-cli`
- `vim-dispatch`
- [OPTIONAL] `ctags` for tags generation
- [OPTIONAL] `picocom` - to use the `MonitorSerial` command

### Installing the plugin

| Plugin manager | How to install                                                                                |
| :------------- | :-------------------------------------------------------------------------------------------- |
| [Dein][1]      | `call dein#add('bergercookie/vim-debugstring')`                                               |
| [minpac][2]    | `call minpac#add('bergercookie/vim-debugstring')`                                             |
| [Pathogen][3]  | `git clone https://github.com/bergercookie/vim-debugstring.git ~/.vim/bundle/vim-debugstring` |
| [Plug][4]      | `Plug 'bergercookie/vim-debugstring'`                                                         |
| [Vundle][5]    | `Plugin 'bergercookie/vim-debugstring'`                                                       |
| manual         | copy all of the files into your `.vim` directory (or `~/.config/nvim` if you're using neovim) |

[1]: https://github.com/Shougo/dein.vim
[2]: https://github.com/k-takata/minpac
[3]: https://github.com/tpope/vim-pathogen
[4]: https://github.com/junegunn/vim-plug
[5]: https://github.com/VundleVim/Vundle.vim

## FAQ

- I want to change the architecture to use without restarting vim:

  You can change the environment variable of vim's shell as follows:
  `let $ARDUINO_ARCH="<new-fqbn-name>"`

## License

Current plugin is distributed under the same terms as Vim itself. See the
[LICENSE](https://github.com/bergercookie/vim-debugstring/blob/master/LICENSE)
file

## Self Promotion

In case you like the plugin, you might as well [star it on
Github](https://github.com/bergercookie/vimduino) or [TODO rate it on
vim.org]() Also feel
free to check my [other
plugins](https://github.com/bergercookie?tab=repositories)

## TODO List

- Menu in vim for picking the architecture to compile/upload
