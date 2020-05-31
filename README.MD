# UNIX user dotfiles
* These are the dotfiles for UNIX distribution 
# What are Dotfiles?
![screenshot](images/Screenshot.png)
* User-specific application configuration is traditionally stored in so called dotfiles (files whose filename starts with a dot). It is common practice to track dotfiles with a version control system such as Git to keep track of changes and synchronize dotfiles across various hosts. There are various approaches to managing your dotfiles (e.g. directly tracking dotfiles in the home directory v.s. storing them in a subdirectory and symlinking/copying/generating files with a shell script or a dedicated tool). Apart from explaining how to manage your dotfiles this article also contains a list of dotfile repositories from Arch Linux users.

# Installation
## First run the script
```
./install.sh
```
## Download all plugins
* For [vim-plug](https://github.com/junegunn/vim-plug):
```
:PlugInstall
```
## Install language extension
* For [vim-plug](https://github.com/junegunn/vim-plug):
```
:CocInstall coc-snippets coc-git coc-vimlsp coc-git coc-python coc-java coc-json coc-html coc-cmake coc-clangd
```
* For **coc-clangd** neovim needs additional step
```
:CocCommand clangd.install
```
* After installing extensions use the **checkhealth** command for extension entry
```
:checkhealth
```
it should appear a green OK for every entry in the extension, if not follow the ```ADVICE```
## Mac users 
* MacOs doesn't run fonts from the .fonts folder but instead $HOME/Library/Fonts so copy the content from .fonts to the /Library/Fonts and got to Terminal->Preference->Fonts to change to nerdfront for devicons to work
