set nocompatible" 互換モードオフ
set fenc=utf-8" 文字コードの変更
set nobackup" バックアップの非作成
set showcmd" コマンドをステータスに追加
set hidden
set noswapfile
set wrap
set mouse=a
filetype on
filetype plugin on
"-------color--------
syntax on
colorscheme molokai
set t_Co=256
"-------------------

"-----display and search-------
set number" 行数の表示
set cursorline" 現在の行の表示
"set cursorcolumn" 縦の強調(無効)
set virtualedit=onemore" 行末の位置もじさきまでいこうできるように
set smartindent" スマートインデント
set autoindent
set visualbell" ビープの可視化
set showmatch" 括弧の対応表示
set laststatus=2" ステータスライン
set wildmode=list:longest" コマンドラインの補完
set title"タイトル表示
set backspace=indent,eol,start
set clipboard+=unnamed
set clipboard=unnamed" クリップボードを使えるようにする。
set ruler" 行番号列番号の表示
set shiftround
set list"不可視文字の表示 
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set expandtab
set tabstop=4
set shiftwidth=4
set incsearch 
set smartcase" 小文字が場合は区別する
set ignorecase
set wrapscan" 検索を最初に戻す
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
"---------------------------

"-------------keymap----------
nnoremap <Space>h ^
nnoremap <Space>l $
"スペースh=^ スペースl=$
inoremap jj <Esc>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" コントロールなどでウィンドウ移動
nnoremap <C-w><C-h> <C-w><<CR>
nnoremap <C-w><C-l> <C-w><CR>
nnoremap <C-w><C-j> <C-w>-<CR>
nnoremap <C-w><C-k> <C-w>+<CR>
"コントロール矢印でウィンドウサイズの変更
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" insertモードでの移動
nnoremap <Down> gj
nnoremap <Up>   gk
"nnoremap <Right> gl
"nnoremap <Left> gh
inoremap <C-u> <C-g>u<C-u>
nnoremap ; :
vnoremap v $h
inoremap <C-e> <CR>
"カッコの設定
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
inoremap (<CR> ()<Left><CR><UP><Right><CR>
inoremap {<CR> {}<Left><CR><UP><Right><CR>
inoremap <C-<CR>> <Esc>$a<CR>
"---------------------------

"---------dein----------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim',{'build':'make'})

call dein#add('Shougo/neocomplete.vim')

let g:rc_dir = expand('~/.vim/rc')
let s:toml = g:rc_dir . '/dein.toml'
let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

call dein#load_toml(s:toml, {'lazy':0})
call dein#load_toml(s:lazy_toml, {'lazy':1})

call dein#end()
call dein#save_state()

filetype plugin indent on

if dein#check_install()
    call dein#install()
endif
"-----------------------------

let g:neocomplete#enable_at_startup = 1
if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"-----------syntastic-------
"set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"---------------------------

"-------indent-guides-----
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"-------------------------

"-----close tag---------
let g:closetag_html_style=1 
source ~/.vim/vimscript/closetag.vim 
"---------------------

"-------Tree-------
"autocmd vimenter * NERDTree
nnoremap <C-n><C-t> :NERDTree<CR>
"----------------

"----hilight--------
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
"-------------------

" -----Quickrun-----
nnoremap <C-q><C-r> :QuickRun
" ---------------

" ----clang complete-------
" disable auto completion for vim-clanG
let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1

" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

if executable('clang-3.6')
    let g:clang_exec = 'clang-3.6'
elseif executable('clang-3.5')
    let g:clang_exec = 'clang-3.5'
elseif executable('clang-3.4')
    let g:clang_exec = 'clang-3.4'
else
    let g:clang_exec = 'clang'
endif

if executable('clang-format-3.6')
    let g:clang_format_exec = 'clang-format-3.6'
elseif executable('clang-format-3.5')
    let g:clang_format_exec = 'clang-format-3.5'
elseif executable('clang-format-3.4')
    let g:clang_format_exec = 'clang-format-3.4'
else
    let g:clang_exec = 'clang-format'
endif

let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'

" }}}
" -------------------

inoremap $ $$<Left>
inoremap \[ \[\]<Left><Left>
inoremap \item <CR>\item<Space>
inoremap っj <Esc>

