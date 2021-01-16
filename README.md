# toggleTest.vim

It switches between the Test and the Implementation files

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

### Vim8 package loading

```sh
git clone https://github.com/larecg/toggleTest.vim.git ~/.vim/pack/larecg/start/toggleTest.vim
```

## Usage

In any file use `<leader>ft` to toggle between the current file and the test file

### Settings

```vim
" Are all the tests grouped in a nested test folder (default: 1)
let g:toggleTest_useTestFolder = 1

" Avoid creating default mappings (default: 0)
let g:toggleTest_no_mappings = 1

" Folder that contains the test files (default: "tests")
let g:toggleTest_testFolder = "tests"

" Test file suffix (default: "test")
let g:toggleTest_testFileSuffix = "test"

" Create custom mapping to toggle the test file (default `<leader>ft`)
nmap <leader>ft <Plug>ToggleTestFile<CR>

" Create custom mapping to open a vertical split with the toggled file (default `<leader>fT`)
nmap <leader>fT <Plug>VToggleTestFile<CR>

" Create custom mapping to open a horizontal split with the toggled file
nmap <leader>fS <Plug>SToggleTestFile<CR>
```

# Licence

[UNLICENSE](LICENSE)
