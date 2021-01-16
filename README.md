# toggleTest.vim

It switches between the Test file and the Implementation file.

## Installation

### Via Plugin Manager (Recommended)

#### [Vim-Plug](https://github.com/junegunn/vim-plug)

1. Add `Plug 'larecg/toggleTest.vim'` to your vimrc file.
2. Reload your vimrc or restart
3. Run `:PlugInstall`

#### [Vundle](https://github.com/VundleVim/Vundle.vim) or similar

1. Add `Plugin 'larecg/toggleTest.vim'` to your vimrc file.
2. Reload your vimrc or restart
3. Run `:BundleInstall`

#### [NeoBundle](https://github.com/Shougo/neobundle.vim)

1. Add `NeoBundle 'larecg/toggleTest.vim'` to your vimrc file.
2. Reload your vimrc or restart
3. Run `:NeoUpdate`

#### [Pathogen](https://github.com/tpope/vim-pathogen)

```sh
cd ~/.vim/bundle
git clone https://github.com/larecg/toggleTest.vim.git
```

#### Vim8 package loading

```sh
git clone https://github.com/larecg/toggleTest.vim.git ~/.vim/pack/larecg/start/toggleTest.vim
```

## Usage

In any file use `<leader>ft` to toggle between the current file and the test file

### Settings

```vim

" Avoid creating default mappings (default: 0)
let g:toggleTest_no_mappings = 1

" Create custom mapping to toggle the test file (default `<leader>ft`)
nmap <leader>ft <Plug>ToggleTestFile
```

# Licence

[Public Domain](LICENSE)

