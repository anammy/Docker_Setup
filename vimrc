" Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" Code Folding
Plugin 'tmhedberg/SimpylFold'

" Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'

" Auto-Complete
Plugin 'Valloric/YouCompleteMe'
" Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'

" Tab for completion
" Plugin 'ervandew/supertab'

" Syntax Checking/Highlighting
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

" Color Schemes
" Plugin 'jnurmine/Zenburn'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'dikiaap/minimalist'
Plugin 'aonemd/kuroi.vim'

" File tree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Super Searching
Plugin 'kien/ctrlp.vim'

" Git integration
Plugin 'tpope/vim-fugitive'

" Status bar to display current virtualenv, git branch, files being edited, etc
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" For Conda environment
" Plugin 'cjrh/vim-conda'

"Vim/Tmux
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Define leader
let mapleader=","

" Enable line numbering
set nu

" Set mouse mode to resize the splits
set mouse=n

" Change split directions
set splitbelow
set splitright

" split navigations
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

"Folding based on indentation: (-optional)
autocmd FileType python set foldmethod=indent

" Enable folding with the spacebar
nnoremap <space> za

" See Docstring for folded code:
let g:SimpylFold_docstring_preview=1

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

" For global file settings
set tabstop=4
set expandtab

"------------Start Python PEP 8 stuff----------------
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Make trailing whitespace be flagged as bad
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Set the default file encoding to UTF-8:
set encoding=utf-8
"----------Stop python PEP 8 stuff--------------

" Code Highlighting
let python_highlight_all=1
syntax on

" Color Scheme
set background=dark
set t_Co=256
silent! colorscheme kuroi

" NERDTree
" Open file directory automatically when vim starts
"autocmd vimenter * NERDTree | wincmd p
" Open file directory when starting vim with no file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open file directory when starting vim in a directory (vim ~/some-directory)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close Vim if the only window left open is the file directory (NERDTree)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Map Ctrl+n to open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
" Map Ctrl+f to find file using NERDTreeFind
nnoremap <C-f> :NERDTreeFind<CR>
" Map i to h for horizontal split window
let g:NERDTreeMapOpenSplit="h"
" Map s to v for vertical split window
let g:NERDTreeMapOpenVSplit="v"
" Close NERDTree close on file open
let g:NERDTreeQuitOnOpen=1

" YCM
" Auto-Complete window goes away after completion
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1
" Defer autocomplete to Tab key
" let g:ycm_key_invoke_completion = '<Tab>'
" let g:ycm_key_list_select_completion = '<Down>'

" Remap keys to find functions in YCM
nnoremap <C-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Jedi-vim
" Disable most of the functionality to avoid conflicts with YCM
" jedi-vim {
        let g:jedi#auto_vim_configuration = 0
        let g:jedi#popup_on_dot = 0
        let g:jedi#popup_select_first = 0
        let g:jedi#completions_enabled = 0
        let g:jedi#completions_command = ""
        let g:jedi#show_call_signatures = "1"

        let g:jedi#goto_assignments_command = "<leader>pa"
        let g:jedi#goto_definitions_command = "<leader>pd"
        let g:jedi#documentation_command = "<leader>pk"
        let g:jedi#usages_command = "<leader>pu"
        let g:jedi#rename_command = "<leader>pr"
    " }

" easy breakpoint python
au FileType python map <silent> <leader>b ofrom pdb import set_trace; set_trace()<esc>
au FileType python map <silent> <leader>B Ofrom pdb import set_trace; set_trace()<esc>

" Vim-conda
let g:conda_startup_msg_suppress=1
nnoremap <F4> :CondaChangeEnv<CR>

"vim_tmux_navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
"1: Write current buffer, but only if changed, 2: Write all buffers
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

"Vimux
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Zoom the tmux runner pane
map <Leader>vz :VimuxZoomRunner<CR>
