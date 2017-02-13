" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'AndrewRadev/splitjoin.vim' " Split single lines, join multiple lines
Plugin 'Raimondi/delimitMate' " Auto-close parenthesis, quotes, etc.
Plugin 'airblade/vim-gitgutter' " Show git additions, etc. in the left gutter
Plugin 'bling/vim-bufferline' " Show list of buffers in command bar
Plugin 'easymotion/vim-easymotion'
Plugin 'ervandew/supertab' " Tab completion
Plugin 'gmarik/Vundle.vim' " Vundle
Plugin 'godlygeek/tabular' " Align selection based on regex pattern
Plugin 'kien/ctrlp.vim' " Fuzzy finder
Plugin 'mbbill/undotree'
Plugin 'mxw/vim-jsx'
Plugin 'ngmy/vim-rubocop'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'schickling/vim-bufonly'
Plugin 'scrooloose/syntastic'
Plugin 'skalnik/vim-vroom'
Plugin 'suan/vim-instant-markdown'
Plugin 'szw/vim-maximizer'
Plugin 'timcharper/textile.vim'
Plugin 'tmhedberg/matchit'
Plugin 'tomtom/tcomment_vim'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-ruby/vim-ruby'
call vundle#end()

" Colorscheme
set t_Co=256
let g:solarized_termtrans = 1
syntax enable
set background=dark
colorscheme solarized

" autosave buffers
set autowriteall
autocmd BufLeave,FocusLost * wall

set ignorecase
set smartcase

" 80 character line limit
set cc=80

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set shell=/bin/bash
set nobackup
set nowritebackup
set history=50 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
setlocal spell spelllang=en_us
set spell
set number
set undofile
set undodir=~/.vim/undo
set gdefault
let mapleader = ","
let g:vimrubocop_config='~/.config/rubocop/ruby-style.yml'
let g:EasyMotion_smartcase = 1

nmap f <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
nmap <leader>w <Plug>(easymotion-overwin-w)

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <leader><Leader>h <Plug>(easymotion-linebackward)
map <leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"remove the search highlight
nnoremap <leader><space> :noh<cr>

"jump to normal mode from insert mode
inoremap jj <ESC>

"move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set clipboard=unnamed
nnoremap ; :

augroup reload_vimrc
  autocmd!
  autocmd bufwritepost ~/.vimrc nested source ~/.vimrc
augroup end

"netrw configuration
let g:netrw_liststyle = 3
let g:netrw_list_hide = '.DS_Store, .localized'  " hide these files
let g:netrw_preview = 1 " use 'p' to open file on the right

set relativenumber

"go back to previous file
noremap <Leader>b :b#<CR>

"open test
noremap <Leader>ot :vsplit<ENTER><C-w>l:A<ENTER>

"source vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>

let ruby_space_errors = 1
set list!
set list listchars=tab:»·,trail:·
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd BufNewFile,BufRead *.ctl setf ruby

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

set autoindent		" always set autoindenting on

endif " has("autocmd")
set directory=~/.vim/swp

set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: ,e
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: ,t
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>

let g:livepreview_previewer = 'open -a Skim'

vmap D y'>p

" For Haml
au! BufRead,BufNewFile *.haml         setfiletype haml

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>

" Display extra whitespace
" set list listchars=tab:»·,trail:·
let g:Conque_TERM = "xterm"

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
set grepprg=grep\ -nH\ $*
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

autocmd InsertEnter,InsertLeave * set cul!
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Numbers
set number
set numberwidth=5

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set complete=.,w,b,u,t
set completeopt=longest,menu
set wildmode=list:longest,list:full

" run one rspec example or describe block based on cursor position
" map <D-r> <ESC>:w<CR>:RunSpec<CR>
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "Dispatch bundle exec rspec {spec}"
let g:vroom_cucumber_path = "spinach"
let g:vroom_use_dispatch = 1
let g:vroom_ignore_color_flag = 1
map <Leader>t :VroomRunTestFile<CR>
map <Leader>s :VroomRunNearestTest<CR>
map <Leader>l :VroomRunLastTest<CR>

map <C-b> <ESC>:BufOnly<cr>
function! RailsScriptSearch(args)
  let l:savegrepprg = &grepprg
  let l:savegrepformat = &grepformat

  try
    set grepprg=script/find
    set grepformat=%f:%l:%m

    execute "grep " . a:args
  finally
    execute "set grepformat=" . l:savegrepformat
    execute "set grepprg=" . l:savegrepprg
  endtry
endfunction

" search with explicitly provided arguments
command! -n=? Rgrep :call RailsScriptSearch('<args>')

" search for the word under the cursor
map <leader>rg :silent call RailsScriptSearch(expand("'<cword>'"))<CR>:cc<CR>

" search for the method definition of the word under the cursor
map <leader>rd :silent call RailsScriptSearch(expand("'def <cword>'"))<CR>:cc<CR>
" TextMate cmd+T mode

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold guibg=#9aadd5 guifg=black
augroup mkd

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;

augroup END

set statusline=%<%f%h%m%r%=%{strftime(\"%l:%M\")}\ %l,%c%V\ %P%{fugitive#statusline()}
let g:ConqueTerm_Color = 1
let g:ConqueTerm_TERM = 'vt100'
let g:ConqueTerm_ReadUnfocused = 0
let g:ConqueTerm_CWInsert = 0

let g:bufferline_rotate = 2

"rails.vim specific shortcut
noremap <leader>rm :Rmodel
noremap <leader>rc :Rcontroller
noremap <leader>rv :Rview
noremap <leader>rs :Rspec
noremap <leader>rl :Rlib

"buffers
noremap <leader>bd :bd<CR>
let g:SimpleJsIndenter_BriefMode = 1
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_TERM = 'xterm'
"mouse support in terminal
set mouse=a
set mousehide
set noswapfile

let g:rails_projections = {
	      \ "features/*.feature": {
	      \   "command": "features",
	      \   "keywords": "features",
	      \   "test": [
	      \     "features/steps/{}.rb",
	      \   ],
        \ },
	      \ "features/steps/*.rb": {
	      \   "command": "steps",
	      \   "keywords": "steps"
        \ },
	      \ "app/classes/decorators/*.rb": {
	      \   "command": "decorator",
	      \   "test": [
	      \     "spec/classes/decorators/%s_spec.rb"
	      \   ],
	      \   "keywords": "decorator"
        \ }
        \}

hi! DiffAdd      guibg=#003300
hi! DiffChange   guibg=#003300
hi! DiffDelete   guifg=#330000 guibg=#330000
hi! DiffText     guibg=#990000
