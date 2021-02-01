set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ============================= PLUGINS =======================================
Plugin 'VundleVim/Vundle.vim'
"Plugin 'vim-scripts/L9'
Plugin 'tpope/vim-fugitive'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
"Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf'
"Plugin 'christoomey/vim-conflicted'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'mattn/emmet-vim'
"Plugin 'sjl/gundo.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
"Plugin 'godlygeek/tabular'
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
"Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
"Plugin 'tmhedberg/SimpylFold'
"Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'tomtom/tcomment_vim'
Plugin 'vim-airline/vim-airline' " status line, the bar at the bottom of the screen
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kana/vim-arpeggio'
Plugin 'vim-scripts/ReplaceWithRegister' " gr verb to replace with what is in register
Plugin 'kana/vim-textobj-user' " l (al ou il) : line object : ex cal to change all line without trailing spaces
Plugin 'kana/vim-textobj-indent' " i/I object for indent : ex >iI to indent inner indent
Plugin 'kana/vim-textobj-line' " l (al ou il) : line object : ex cal to change all line without trailing spaces
"Plugin 'aaronbieber/vim-quicktask' " notes tool


" ==== PLUGIN THEMES ====
"Plugin 'vim-scripts/darktango.vim'
"Plugin 'jonathanfilip/vim-lucius'
Plugin 'morhetz/gruvbox'
" ==== END PLUGIN THEMES ====

"" ==== PLUGIN SYNTAXES ====
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
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
"
"set nofoldenable
set nrformats-=octal  " remove octal incrementation of ctrl-a
set path+=**
set encoding=utf-8
set list  " to see the end of lines
if &listchars ==# 'eol:$'
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

"set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
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
"set smartindent
"set autoindent
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
set lbr " line break
set scrolloff=0 " show lines above and below cursor (when possible)
set showcmd " show current command
set backspace=indent,eol,start " allow backspacing over everything
set lazyredraw " skip redrawing screen in some cases
set autochdir " automatically set current directory to directory of last opened file
set history=8192 " more history
set undolevels=500
set nojoinspaces " suppress inserting two spaces between sentences
"" tab completion for files/buffers
set wildmenu
"set wildmode=longest,list
set wildmode=list,longest,full
"set mouse+=a " enable mouse mode (scrolling, selection, etc)
set dictionary+=/usr/share/dict/words
set dictionary+=~/Documents/Projects/Scrabble/mots.txt
"set shellcmdflag=-ic " To be able to use shell aliases within !commands --> makes gvim invisible (no windows, just the unkillable process, when run from ubuntu explorer
set viminfo='100,f1,<100,:1000,@1000,/1000,%100 "Open vim where it was left when last closed

"" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
autocmd!
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
augroup END

"" opens help in vertical split
autocmd FileType help wincmd L

" disable audible bell
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"let python_highlight_all=1
if v:version > 703 || v:version == 703 && has("patch541")
set formatoptions+=j " Delete comment character when joining commented lines
endif

au BufNewfile, BufRead *.py
   \ set tabstop=4
   \ set softtabstop=4
   \ set shifwidth=4
   \ set textwidth=79
   \ set expandtab
   "\ set autoindent
   \ set filformat=unix

" Add FZF to runtimepath
"set rtp+=/usr/local/opt/fzf
set rtp+=/home/linuxbrew/.linuxbrew/bin/fzf

"autocmd BufWritePost *.py call Flake8() " Call a flake8 check every time I save
command! MakeTags !ctags -R .

" ============================= ABBREVIATIONS =================================
ia fu function
ia aur Aurélien Febvre
ia pe peut-être
ia Pe Peut-être
ia auj aujourd'hui
ia Auj Aujourd'hui
ia wh WHO:

" ============================= REMAPS ========================================
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ==== Motions remap ====
" Escape in insert mode
inoremap jj <ESC>
" Auto complete (filename, line, word from dict)
inoremap <C-B> <C-X><C-F>
inoremap <C-L> <C-X><C-L>
inoremap <C-K> <C-X><C-K>
" Move to the 79th column
nnoremap <C-Space> 079l
" Add a line above/below and enter insert mode in it
nnoremap <C-CR> o<ESC>k
nnoremap <S-CR> O<ESC>j
" glue current line with line above
nnoremap gj kJ
" Move between splits of window
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>l <C-W><C-L>
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>o <C-W><C-O>
" Easy closing of buffers
nnoremap <Leader>q :wv<CR>:bd<CR>
"nnoremap <Leader>c :%bd<CR>
nnoremap <Leader>c :call DeleteHiddenBuffers()<CR>
" Select all
nnoremap <Leader>a ggVG
" Opens vimrc and file tree in that directory
nnoremap <Leader>v :e $MYVIMRC<CR>
" Opens python_commands buffer in the background
nnoremap <Leader>p :e ~/dotfiles/Template/python_commands<CR>:bp<CR>
" Vim's grep in many files
nnoremap <Leader>f :vim /
cnoremap <C-D> /gj ~/dotfiles/*<CR>:cope<CR><C-W>L<C-W><CR>
cnoremap <C-P> /gj ~/Documents/**/*.*py*<CR>:cope<CR><C-W>L<C-W><CR>
cnoremap <C-K> /gj ~/Manager/**/*<CR>:cope<CR><C-W>L<C-W><CR>
cnoremap <C-G> /gj <C-R>%<CR>:cope<CR><C-W>L<C-W><CR>
" Apply vimrc changes whithout exiting it
nnoremap <A-s> :source $MYVIMRC<CR>
" Toggle highlight for searched pattern
noremap <F4> :set hlsearch! hlsearch?<CR>

" NEXT/PREVIOUS thing jump ===========
" Buffer
nnoremap <A-l> :bn<CR>
nnoremap <A-h> :bp<CR>
" Tags
noremap <A-o> <C-]>
noremap <A-j> :po<CR>
noremap <A-k> :ta<CR>
" Change list
nnoremap <C-J> g;
nnoremap <C-K> g,
" Quickfix errors
nnoremap <C-L> :cn<CR>
nnoremap <C-H> :cp<CR>
"
" Jumps (selects) back to the previous selected visual area
nnoremap gV `<v`>
" Sort alphabetically the selectionned columns
vnoremap <Leader>s :sort<CR>
" Keep the selection selected when indenting
vnoremap < <gv
vnoremap > >gv
" show trailing whitespaces
nnoremap <Leader>w /\s\+$<CR>
" open a new unamed buffer
nnoremap <Leader>n :vs ene<CR>
" Paragraphs formatting
nnoremap Q gqap
vnoremap Q gq
" Toggle the spell checker
nnoremap <F8> :setlocal spell! spell?<CR>
" Print path of the current file at the cursor
nmap cp :let @" = expand("%:p:h")<cr>""p

" Tasks log mappings
noremap <Leader>T :e /home/aurelf/Manager/TASKS.txt<CR>
noremap <A-d> o<Esc>:r !date "+\%Y-\%m-\%d \%H:\%M:\%S"<CR>kJA ## 
noremap <A-f> kmzjdd/# done<CR>o<Esc>:r !date "+\%Y-\%m-\%d \%H:\%M:\%S - "<CR>p2kJJI- <Esc>>>za'zj
" Windows
"noremap <A-d> :r !date /T<CR>:r !time /T<CR>kJI- <esc>A 
"noremap <A-f> dd/# done<CR>:r !date /T<CR>:r !time /T<CR>p2kJJI- <esc>>>

" ============================= PLUGINS' ======================================

" ==== VIM-ARPEGGIO ====
call arpeggio#load()
Arpeggio noremap jk <ESC>
Arpeggio noremap rp !python<CR>
Arpeggio noremap qp Iprint(<ESC>A)<ESC>V!python<CR>
Arpeggio noremap df :g/<CR>:%s///gn<CR>
Arpeggio noremap fj 4j
Arpeggio noremap dk 4k
Arpeggio noremap nf :e /home/aurelf/dotfiles/Template/pep8_cheatsheet.py<CR>zMgg43jyj<C-O><C-O>p
Arpeggio noremap nc :e /home/aurelf/dotfiles/Template/pep8_cheatsheet.py<CR>zMgg47jyj<C-O><C-O>p
Arpeggio noremap ni :e /home/aurelf/dotfiles/Template/pep8_cheatsheet.py<CR>zMggy39j<C-O><C-O>p
Arpeggio noremap nm :e /home/aurelf/Manager/
"Arpeggio noremap cw :%s/<C-r>///gn<CR>

" ==== NERDTREE ====
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*']
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>
"nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>t :NERDTreeFind<CR>

" ==== CTRLP ====
let g:ctrlp_match_window = 'bottom,order:btt,min:0,max:10,results:200'
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
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python']
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
"nnoremap <Leader>c :SyntasticCheck<CR>
"nnoremap <Leader>r :SyntasticReset<CR>
nnoremap <Leader>i :SyntasticInfo<CR>
nnoremap <Leader>e :Errors<CR>
"
" ==== EASYMOTION ====
"let g:EasyMotion_do_mapping = 0
"let g:EasyMotion_smartcase = 1
nmap F <Plug>(easymotion-s)
"map <Space> <Plug>(easymotion-prefix)
"let g:EasyMotion_keys = 'jkfdlmsqreuiopzatyghnvJKFDLMSQREUIOPZATYGHNV'
let g:EasyMotion_keys = 'jkfdlmsqreuiopzatyghnv'

" ==== GRUVBOX ====
let g:gruvbox_contrast_dark='medium' " soft, medium (default) or hard

" ==== SIMPYLFOLD ====
"let g:SimpylFold_docstring_preview=1
"let g:SimpylFold_fold_docstring=0

"" ==== YOUCOMPLETEME ====
""let g:ycm_python_binary_path = 'python3'
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_min_num_of_chars_for_completion = 1
""let g:ycm_python_interpreter_path = '/home/aurelf/miniconda3/envs/scrab/bin/python3'
""let g:ycm_python_sys_path = []
""let g:ycm_extra_conf_vim_data = [
"  "\  'g:ycm_python_interpreter_path',
"  "\  'g:ycm_python_sys_path'
"  "\]
""let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
"map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ==== JEDI-VIM ====
let g:jedi#use_splist_not_buffers="right"
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signature = "1"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" ==== PYTHON-MODE ====
"let g:pymode = 1 " Turn on the whole plugin
"let g:pymode_warnings = 1  Turn off plugins's warnings
"let g:pymode_paths = []  Add paths to sys.path
"let g:pymode_trim_whitespaces = 1 " Trim unused white spaces on save
"let g:pymode_doc = 1
"let g:pymode_lint = 1
"let g:pymode_lint_on_write = 1
"let g:pymode_lint_unmodified = 0
"let g:pymode_lint_on_fly = 0
"let g:pymode_python = 'python3'

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

setlocal indentexpr=GetGooglePythonIndent(v:lnum)
" Indent Python in the Google way.
function! GetPythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let s:maxoff = 50 " maximum number of lines to look backwards.
let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"

function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
