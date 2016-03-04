" Use Vim settings, rather than Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible
filetype off

set autowrite
set autoread
set history=50
set laststatus=2  " Always display status line
set linespace=2
set nobackup
set nowritebackup
set noswapfile
set ruler         " Show the cursor position all the time
set showcmd       " Display incomplete commands

" Softabs, 2 spaces for Ruby <3
set backspace=2   " Backspace deletes like most programs in insert mode
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
set smartindent

" Fileformat
set fileformat=unix
set fileformats=unix,dos

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Disable the mouse
set mouse=c

" Make it obvious where 80 characters is,
" since a line should not contain more than that
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Splits and windows
set splitbelow
set splitright

" Enable spell check
set spell

" Showing syntax highlight group in statusline
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on
syntax on

" UI Settings
set wildmenu
set t_Co=256
let g:airline_theme='badwolf'
let g:badwolf_darkgutter = 1
let g:badwolf_tabline = 0
let g:badwolf_html_link_underline = 0
let g:badwolf_css_props_highlight = 1
set background=dark
colorscheme Tomorrow-Night-Eighties

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore"
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 1
endif


" May the force be with you
nnoremap <silent> <Left> :bprev<CR>
nnoremap <silent> <Right> :bnext<CR>
nnoremap <Up> :echo "Use k"<CR>
nnoremap <Down> :echo "Use j"<CR>

let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_javascript_checkers = ['standard']
autocmd bufwritepost *.js silent !standard % --format

" Override certain sections of airline
call airline#parts#define_function('syntaxitem','SyntaxItem')
function! AirlineInit()
  let g:airline_section_x = airline#section#create(['syntaxitem',' ','tagbar','filetype'])
endfunction
autocmd VimEnter * call AirlineInit()
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" Set .axlsx to ruby
autocmd BufNewFile,BufRead *.xlsx.axlsx set syntax=ruby

" Add mapping for tagbar
nmap <F8> :TagbarToggle<CR>

" Set source code pro as default font
if has('gui_running')
  set guioptions=emgt     " Hide toolbar and scrollbars
  set lines=999 columns=999
  set guifont=Source\ Code\ Pro\ for\ Powerline\ 9
endif

set lazyredraw

" http://ideasintosoftware.com/vim-productivity-tips/
set relativenumber

" http://ideasintosoftware.com/history-is-a-tree/
set undofile
set undodir=~/.vim/undodir

vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" Detect fastlane config as ruby
au BufNewFile,BufRead *Fastfile set filetype=ruby
