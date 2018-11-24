set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ============================= PLUGINS =======================================
Plugin 'VundleVim/Vundle.vim'
"Plugin 'vim-scripts/L9'
"Plugin 'tpope/vim-fugitive'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
"Plugin 'christoomey/vim-conflicted'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'mattn/emmet-vim'
"Plugin 'sjl/gundo.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
"Plugin 'godlygeek/tabular'
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
"Plugin 'tmhedberg/SimpylFold'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'tomtom/tcomment_vim'

" ==== PLUGIN THEMES ====
"Plugin 'vim-scripts/darktango.vim'
"Plugin 'jonathanfilip/vim-lucius'
Plugin 'morhetz/gruvbox'
" ==== END PLUGIN THEMES ====

"" ==== PLUGIN SYNTAXES ====
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'hdima/python-syntax'
"Plugin 'othree/yajs.vim'
"Plugin 'mitsuhiko/vim-jinja'
"Plugin 'evanmiller/nginx-vim-syntax'
"Plugin 'python-mode/python-mode'
" === END PLUGIN SYNTAXES ====

" ==== END PLUGINS ====

call vundle#end()
filetype plugin indent on

" ============================= BASIC =========================================
let mapleader = " "
" about the indent settings for python, see the google python indent setting
" file (il faut l'intégrer dans le file .python dans le dossier indent de
" l'installation de vim
"set nofoldenable
set encoding=utf-8
set foldmethod=indent
set foldlevel=0
set ignorecase
set smartcase
set tagstack
set clipboard=unnamedplus
colorscheme gruvbox
"set guifont=Lucida_console:h9
"set fillchars+=vert:\$
syntax enable
set background=dark
set ruler " Position of the cursor (lines, columns)
set hidden
set relativenumber " Relative line numbering
set number " Line numbering
set laststatus=2
set smartindent
set autoindent
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=79
let &colorcolumn="80"
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set lines=999 columns=999
set hlsearch
" Clean up the . directory by putting backup, swap, undo files in another dir
set undofile  " Maintain undo history between sessions
set backup
set undodir=~/.vim/vim_files  " Don t forget to create the directory
set directory=~/.vim/vim_files  " Don t forget to create the directory
set backupdir=~/.vim/vim_files  " Don t forget to create the directory

set incsearch " Incremental search (as string is being typed)
"    set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set lbr " line break
set scrolloff=0 " show lines above and below cursor (when possible)
set showcmd " show current command
set backspace=indent,eol,start " allow backspacing over everything
set lazyredraw " skip redrawing screen in some cases
set autochdir " automatically set current directory to directory of last opened file
set history=8192 " more history
set nojoinspaces " suppress inserting two spaces between sentences
"" tab completion for files/buffers
set wildmenu
"set wildmode=longest,list
set wildmode=list,longest,full
"set mouse+=a " enable mouse mode (scrolling, selection, etc)
"" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END
" disable audible bell
set noerrorbells visualbell t_vb=
" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set history=500
set undolevels=500

au BufNewfile, BufRead *.py
        \ set tabstop=4
        \ set softtabstop=4
        \ set shifwidth=4
        \ set textwidth=79
        \ set expandtab
        \ set autoindent
        \ set filformat=unix


" ============================= REMAPS ========================================
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ==== Motions remap ====
nnoremap <C-Space> 079l
nnoremap <C-C> I# <ESC>
nnoremap <C-CR> o<ESC>k
nnoremap <S-CR> O<ESC>j
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>o <C-W><C-O>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
"nnoremap <C-O> <C-W><C-O>
nnoremap <space> zA
"nnoremap <Tab> cw<Tab>
" Apply vimrc changes whithout exiting it
nnoremap <A-s> :source $MYVIMRC<CR>
inoremap jj <ESC>
noremap <F4> :set hlsearch! hlsearch?<CR>
" Switch to next/previous tab
"nnoremap <A-l> <C-PageDown>
"nnoremap <A-h> <C-PageUp>
" Switch to next/previous buffer
nnoremap <A-l> :bn<CR>
nnoremap <A-h> :bp<CR>
" Jumps to a tag, and between (back and forth) tags already visited
map <A-o> <C-]>
map <A-j> :po<CR>
map <A-k> :ta<CR>
" go to previous/next jump position
"nnoremap <Leader>l g;
"nnoremap <Leader>h g,
nnoremap <C-J> g;
nnoremap <C-K> g,
" sort alphabetically the selectionned columns
vnoremap <Leader>t :sort<CR>
" keeps the selection selected when indenting
"vnoremap < <gv
"vnoremap > >gv
" shows trailing whitespaces
nnoremap <Leader>w /\s\+$<CR>
" Paragraphs formatting
nmap Q gqap
vmap Q gq

" ============================= PLUGINS' ======================================

" ==== NERDTREE ====
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*']
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>
"nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" ==== CTRLP ====
nnoremap <A-p> :CtrlP ~<CR>
"let g:ctrlp_working_path_mode = '0'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_show_hidden = 1

" ==== SYNTASTIC ====
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
"let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python']
"let g:syntastic_yaml_checkers = ['jsyaml']
"let g:syntastic_html_tidy_exec = 'tidy5'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = {
"    \ 'mode': 'passive',
"    \ 'active_filetypes': [],
"    \ 'passive_filetypes': []
"\}
nnoremap <Leader>s :SyntasticCheck<CR>
nnoremap <Leader>r :SyntasticReset<CR>
nnoremap <Leader>i :SyntasticInfo<CR>
"
" ==== EASYMOTION ====
"let g:EasyMotion_do_mapping = 0
"let g:EasyMotion_smartcase = 1
nmap F <Plug>(easymotion-s)
"map <Space> <Plug>(easymotion-prefix)

" ==== EASYMOTION ====
"let g:SimpylFold_docstring_preview=1
"let g:SimpylFold_fold_docstring=0

" ==== EASYMOTION ====
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ==== VIM-BETTER-WHITESPACE ====
"let g:EnableWhitespace = 1

" ==== INCSEARCH ====
"map / <Plug>(incsearch-forward)
"map ? <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)
"
" ==== INCSEARCH-EASYMOTION ====
"map z/ <Plug>(incsearch-easymotion-/)
"map z? <Plug>(incsearch-easymotion-?)
"map zg/ <Plug>(incsearch-easymotion-stay)
"
" ==== MARKDOWN ====
"let g:markdown_fenced_languages = [
"    \ 'bash=sh',
"    \ 'c',
"    \ 'coffee',
"    \ 'erb=eruby',
"    \ 'javascript',
"    \ 'json',
"    \ 'perl',
"    \ 'python',
"    \ 'ruby',
"    \ 'yaml',
"    \ 'go',
"\]
