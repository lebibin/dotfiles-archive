" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" So long vundle, we shall now use plug since yarn
" showed me the power of parallel package installation
call plug#begin('~/.local/share/nvim/site')

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dracula/vim'
Plug 'gavocanov/vim-js-indent'
Plug 'gregsexton/MatchTag'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'janko/vim-test'
Plug 'mhinz/vim-startify'
Plug 'milch/vim-fastlane'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'takac/vim-hardtime'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/nginx.vim'
Plug 'wakatime/vim-wakatime'
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

" Use Vim settings, rather than Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible
filetype off

set encoding=utf8

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

" https://kinbiko.com/vim/my-shiniest-vim-gems/
" show thy column
set cursorcolumn
set cursorline

" Let's enable folding!
set foldenable
set foldmethod=syntax
set foldlevel=1

" https://stackoverflow.com/a/1878984
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Use system clipboard
if $TMUX == ''
  set clipboard+=unnamed
endif

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
" http://ideasintosoftware.com/vim-productivity-tips/
set number
set numberwidth=5
set relativenumber
nnoremap <C-n> :set nu!<CR>:set rnu!<CR>

" Splits and windows
set splitbelow
set splitright

" Enable spell check
set spell

" Nvim shows weird symbols (�[2 q) when changing modes
set guicursor=

" Showing syntax highlight group in statusline
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

filetype plugin indent on
syntax on

" UI Settings
set wildmenu
set t_Co=256
set background=dark
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme dracula
let g:airline_theme='dracula'

" May the force be with you
nnoremap <silent> <Left> :bprev<CR>
nnoremap <silent> <Right> :bnext<CR>
nnoremap <Up> :echo "Use k"<CR>
nnoremap <Down> :echo "Use j"<CR>

" pangloss vim-js configuration
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
set conceallevel=1

" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str         = 'E'
let g:ale_echo_msg_warning_str       = 'W'
let g:ale_echo_msg_format            = '[%linter%] %s [%severity%]'
let g:ale_sign_error                 = '!'
let g:ale_sign_warning               = '?'
let g:ale_lint_on_text_changed       = 'never'
let g:ale_lint_on_enter              = 0
let b:ale_linters = ['stylelint', 'rubocop']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Override certain sections of airline
call airline#parts#define_function('syntaxitem','SyntaxItem')
function! AirlineInit()
  let g:airline_section_x = airline#section#create(['syntaxitem',' ','tagbar','filetype'])
endfunction
autocmd VimEnter * call AirlineInit()
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1


" Add mapping for tagbar
nmap <F8> :TagbarToggle<CR>

set lazyredraw

" http://ideasintosoftware.com/history-is-a-tree/
set undofile
set undodir=~/.vim/undodir

" For startify - htps://github.com/mhinz/vim-startify
if !has('nvim')
  set viminfo='100,n$HOME/.vim/files/info/viminfo'
endif
let g:startify_list_order = [
      \ ['   MRU'],           'files' ,
      \ ['   MRU '.getcwd()], 'dir',
      \ ]

let g:startify_change_to_dir          = 0
let g:startify_files_number           = 3
let g:startify_session_delete_buffers = 1
let g:startify_session_autoload       = 1
let g:startify_skiplist               = [
      \ 'COMMIT_EDITMSG',
      \ $VIMRUNTIME .'/doc',
      \ 'bundle/.*/doc',
      \ '\.DS_Store'
      \ ]
let g:startify_custom_footer = 'startify#fortune#boxed()'
" https://old.reddit.com/r/ProgrammerHumor/comments/a381ur/the_correct_reaction_to_unit_tests_passing/eb4csj8/
let g:startify_custom_header = [
      \",*************,,*/(((((//,,*(#%%%%%%%%%%%%%%%#(*,,,****************************************************,*/(((((((((/((((////****/((##%%%%%%",
      \",*************,,//((((((//,,*(%%%%%%%%%%%%%%%%%##/*****************************************************,,*/(///(//////****//((##%%%%%%%%%%%",
      \",************,,*/(((((((//***/#%%%%%%%%%%%%%%%%%%%#(/***************************************************,*//////////*//((#%%%%%%%%%%%%%%%%%",
      \",***********,,*////////////***/##%%%%%%%%%%%%%%%%%%%##(*,***********************************************,,*////////(###%%%%%%%%%%%%%%%%%%%%",
      \",**********,,,*/*******//////**/(#%%%%%%%%%%%%%%%%%%%%%#(/**********************************************,,,***/(##%%%%%%%%%%%%%%%%%%%%%%%%%",
      \",*********,,,,*************///***/(#%%%%%%%%%%%%%%%%%%%%%%#(/***********************************,****,****/((#%%%%%%%%%%%%%%%%%%%%%%%%%%%%#",
      \",*********,,,***************//****/(##%%%%%%%%%%%%%%%%%%%%%%##//**************//////////////////////((#####%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(",
      \",********,,,,***********************/(#%%%%%%%%%%%%%%%%%%%%%%%##################%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(/",
      \",*******,..,***********************,,*/##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%###((//",
      \",*******,.,,***********************,,,,*(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(//**//",
      \",******,.,,,************************,,,,*/(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(//*******",
      \",*****,,,,,********,***,,,,,,,,,,,,*,,,,,,*/(######%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(/**********",
      \",*****,..,*******,,,,,,,,,,,,,,,,,,,,,,*,,,,*///((#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%###(/************",
      \",*****,,,*******,,,,,*,,,,,,,,,,,,,,,,,****,,,*/(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#######(//**************",
      \",****,.,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,**,,,/(%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#((//******************",
      \",***,..,,,,,,,,,,,,,,,,,,,,,,,,,,,,,..,,,,,,,*(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(/*******************",
      \",**,,.,,,,,,,,,,,,,,,,,,,,,,,,,,.......,,,,,,/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#####%%%%%%%%%%%%%%%%#(/******************",
      \",**,..,,,,,,,,,,,,,,,,,,,,,,,,,......,,,*,,,*(#%%%%%%%%##(((/(##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(((/*/((#%%%%%%%%%%%%%%#(/*****************",
      \",*,..,,,,,,,,,,,,,,,,,,,,,,,,,,,.....,,**,,*/#%%%%%%%##((((*,**/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%##((##/,,,*(#%%%%%%%%%%%%%%#(*****************",
      \".*,.,,,**,,,,,,,,,,,,,,,,,,,,,,,,,,*****,,,/(%%%%%%%%#(//(#/,..*/#%%%%%%%%%%%%%%%%%%%%%%%%%%%#(//(#/,..,/(#%%%%%%%%%%%%%%#/*****///////////",
      \".,..,,,,,,,,,,,,,,,,,,,,,,,,,,*,,*******,,,(#%%%%%%%%#(*,,,....,/#%%%%%%%%%%%%%%%%%%%%%%%%%%%#(*,,,....,/(#%%%%%%%%%%%%%%#(*,**////////////",
      \".,..,,,,,,,,,...........,,,,,,*,********,,*(#%%%%%%%%%#(/*,,...,/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(/*,,..,*/##%%%%%%%%%%%%%%%#(***////////////",
      \"...,,,,,,,................,,*,**********,,/#%%%%%%%%%%%%#((////((#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##((///(#%%%%%%%%%%%%%%%%%%(/**////////////",
      \"..,,,,,,.................,,,**********,,*(#%%%%%%%%%%%%%%%%%%#%%%%%%%%#((///((#%%%%%%%%%%%%%%%%%%%%%#%%%%%%%%%%%%%%%%%%%%%#/**////////////",
      \".,,,,,,,,.................,,***********,,/(####%%%%%%%%%%%%%%%%%%%%%%%%#(/*,,,*(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(/*////////////",
      \".,***,,,,,,..............,,,**********,..,***//((##%%%%%%%%%%%%%%%%%%%%%%%##((##%%%%%%%%%%%%%%%%%%%%%%%%%##(((((((((###%%%%%#/**///////////",
      \".*****,,,,,,,,,,,,,,,,,,,*************,..,*******/(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##///*//////((#%%%%%#(**///////////",
      \".****************/******/***////*****,.,*///////**/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(////////////(#%%%%%#/**//////////",
      \".***********************/////*******,..,*//////////(#%%%%%%%%%%%%%%%%%%%%##########%%%%%%%%%%%%%%%%%%%%#(///////////*/(#%%%%%#(***/////////",
      \".************************///********,..,*//////////#%%%%%%%%%%%%%%%%%%#(//*****///(((##%%%%%%%%%%%%%%%%#(///////////**/##%%%%##/***////////",
      \".***********************************,.,,***///////(#%%%%%%%%%%%%%%%%#(/*,,,*//((((////(#%%%%%%%%%%%%%%%#((////////////(#%%%%%%#(*********//",
      \",***********,,,*,,*,,**************,,,*//******//(#%%%%%%%%%%%%%%%%%#(*,,*/(((#####(((((#%%%%%%%%%%%%%%%##///////////(#%%%%%%%%#(***///////",
      \",*************,,**,,,************,,,,,/(##((((####%%%%%%%%%%%%%%%%%%%(/**/(((#((((#((//(#%%%%%%%%%%%%%%%%%#(((((((((##%%%%%%%%%%#/**///////",
      \",******************************,,,,,,,*(#%#%%%%%%%%%%%%%%%%%%%%%%%%%%#(**/((#(#(((#((//(#%%%%%%%%%%%%%%%%%%%%%%%#%#%%%%%%%%%%%%%#(**///////",
      \",*************,**************,****,,,,,/(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(/*/((((#((((///(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(/*///////",
      \",*************************************,*/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(////////////(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#/**/////*",
      \",******////****///////////////////////***/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%####(((((((###%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(********",
      \".,*,****///////////////////////////////***/#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#(/*******",
      \".,,,,*****//////////////////////////*******(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##(*******",
      \".,,,,,,***********/////////////////********/(#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%(*******",
      \]

vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" Detect weird files' language
au BufNewFile,BufRead *.xlsx.axlsx set filetype=ruby
au BufNewFile,BufRead *BUCK set filetype=python

" http://www.devinrm.com/2016/02/16/ditching-ctrl-p/
" Fuzzy-find with fzf
map <C-p> :Files<cr>
nmap <C-p> :Files<cr>

" Customize fzf
let g:fzf_layout = { 'down': '~19%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':    ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" http://stackoverflow.com/a/2559262
set scrolloff=3         " 2 lines above/below cursor when scrolling
set showmatch           " show matching bracket (briefly jump)
set showmode            " show mode in status bar (insert/replace/...)
set title               " show file in titlebar
set matchtime=3         " show matching bracket for 0.3 seconds
set matchpairs+=<:>     " specially for html
set hidden              " remember undo after quitting
set confirm             " get a dialog when :q, :w, or :wq fails

" vim-easy-align mappings
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Setup vim-vue
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" https://github.com/prettier/vim-prettier
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Configure UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Hardtime challenge accepted
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
