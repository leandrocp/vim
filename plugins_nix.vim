NeoBundle 'tpope/vim-fugitive' "{{{
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gr :Gremove<CR>
  autocmd FileType gitcommit nmap <buffer> U :Git checkout -- <C-r><C-g><CR>
  autocmd BufReadPost fugitive://* set bufhidden=delete
"}}}

NeoBundle 'scrooloose/syntastic'

NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'elzr/vim-json', {'autoload':{'filetypes':['javascript','json']}}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','ls','typescript']}}

NeoBundleLazy 'vim-ruby/vim-ruby'
NeoBundleLazy 'tpope/vim-rails'
NeoBundleLazy 'tpope/vim-bundler'
NeoBundleLazy 'tpope/vim-rake'

NeoBundleLazy 'elixir-lang/vim-elixir'

NeoBundleLazy 'plasticboy/vim-markdown' "{{{
  let g:vim_markdown_frontmatter=1
"}}}

NeoBundleLazy 'chase/vim-ansible-yaml'

NeoBundleLazy 'dsawardekar/ember.vim', {'autoload':{'filetypes':['javascript','coffee','typescript']}}
NeoBundleLazy 'mustache/vim-mustache-handlebars' "{{{
  let g:mustache_abbreviations = 1
"}}}

NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'paradigm/TextObjectify'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'lucapette/vim-textobj-underscore'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-surround'
"NeoBundle 'sickill/vim-pasta'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'editorconfig/editorconfig-vim'
