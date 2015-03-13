" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

set all& "reset everything to their defaults
set nocompatible "vim
filetype plugin indent on
syntax enable

" detect OS {{{
  let s:is_windows = has('win32') || has('win64') || has('win32unix')
  let s:is_nix     = has('mac') || has('macunix') || has('unix')
  let s:is_gui     = has('gui_running')
"}}}

" windows {{{
  if s:is_windows
    set rtp+=$HOME/.nvim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.nvim/after
  endif
"}}}

" functions {{{
  function! EnsureExists(path)
    if !isdirectory(expand(a:path))
      call mkdir(expand(a:path))
    endif
  endfunction
"}}}

" base {{{
  let mapleader=" "
  let g:mapleader=" "
  set encoding=utf-8                                  "set encoding for text
  set timeoutlen=300                                  "mapping timeout
  set ttimeoutlen=50                                  "keycode timeout
  set mouse=a                                         "enable mouse
  set mousehide                                       "hide when characters are typed
  set history=1000                                    "number of command lines to remember
  set ttyfast                                         "assume fast terminal connection
  set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility
  set hidden                                          "allow buffer switching without saving
  set autoread                                        "auto reload if file saved externally
  set fileformats+=mac                                "add mac to auto-detection of file format line endings
  set fileformat=unix                                 "default file format
  set nrformats-=octal                                "always assume decimal numbers
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*,*/bower_components/*,*/target/*,*/DS_Store/*,*/tmp/*,*/plugged/*
  set showcmd
  set tags=tags;/
  set showfulltag
  set modeline
  set modelines=5
  " disable annoying sounds
  set noerrorbells
  set novisualbell
  set t_vb=
  set display+=lastline
  if $TMUX == ''
    set clipboard+=unnamed
  endif
"}}}

" ui {{{
  set showmatch                                       "automatically highlight matching braces/brackets/etc.
  set matchtime=2                                     "tens of a second to show matching parentheses
  "set relativenumber                                  "hybrid line numbers
  set number                                          "line numbers are good
  set lazyredraw
  set laststatus=2
  set noshowmode
  set nofoldenable                                    "don´t enable folds by default
  set foldmethod=syntax                               "fold via syntax of files
  set foldlevelstart=99                               "open all folds by default
  let g:xml_syntax_folding=1                          "enable xml folding
  set scrolloff=8                                     "always show content after scroll
  set sidescrolloff=15
  set sidescroll=1
  set splitbelow
  set splitright
  set cursorline
  autocmd WinLeave * setlocal nocursorline
  autocmd WinEnter * setlocal cursorline
  let &colorcolumn=120

  if s:is_gui
    set lines=999 columns=9999
    set guioptions+=t                                 "tear off menu items
    set guioptions-=T                                 "toolbar icons
    if s:is_windows
      autocmd GUIEnter * simalt ~x
    endif
	endif
"}}}

" search {{{
  set hlsearch                                        "highlight searches
  set incsearch                                       "incremental searching
  set ignorecase                                      "ignore case for searching
  set smartcase                                       "do case-sensitive if there's a capital letter
  set gdefault                                        "global default on
  "noremap <CR> :nohlsearch<CR>
  if executable('ack')
    set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
    set grepformat=%f:%l:%c:%m
  endif
  if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
  endif
"}}}

" files/folders {{{
  set undofile
  set undodir=~/.nvim/.cache/undo
  set backup
  set backupdir=~/.nvim/.cache/backup
  set directory=~/.nvim/.cache/swap
  set noswapfile
  call EnsureExists('~/.nvim/.cache')
  call EnsureExists(&undodir)
  call EnsureExists(&backupdir)
  call EnsureExists(&directory)
"}}}

" indent/whitespace {{{
  set backspace=indent,eol,start                      "allow backspacing everything in insert mode
  set autoindent
  set smartindent
  set smarttab                                        "use shiftwidth to enter tabs
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab                                       "spaces instead of tabs
  set nostartofline                                   "don't jump to the start of line when scrolling
  set nowrap                                          "don't wrap lines
  set linebreak                                       "wrap lines at convenient points
  set shiftround
  set linebreak
"}}}

" mappings/autocmd {{{
  source ~/.nvim/mappings.vim

  " go back to previous position of cursor if any
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \  exe 'normal! g`"zvzz' |
    \ endif

  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  au BufRead,BufNewFile *.scss set filetype=scss.css
  au BufNewFile,BufRead *.md,*.markdown set filetype=markdown

  set autoread
  au FocusGained,BufEnter * :silent! !
  au FocusLost,WinLeave * :silent! w
"}}}

" plugins {{{
  call plug#begin('~/.nvim/plugged')
  source ~/.nvim/plugins.vim
  if s:is_windows
    source ~/.nvim/plugins_win.vim
  else
    source ~/.nvim/plugins_nix.vim
  endif
  call plug#end()
"}}}

" theme {{{
  set background=dark
  if $TMUX == ''
    let base16colorspace=0
  else
    let base16colorspace=256
  endif
  colorscheme base16-tomorrow
"}}}
