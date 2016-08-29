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
filetype indent on
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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set incsearch
set smartcase" 小文字が場合は区別する
set ignorecase
set wrapscan" 検索を最初に戻す
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
set wildmenu
set wildmode=longest:full,full
"---------------------------

"-------------keymap----------
nnoremap <Space>h ^
nnoremap <Space>l $
"スペースh=^ スペースl=$
nnoremap :: :!
nnoremap ; :
nnoremap ;; :!
nnoremap <Down> gj

nnoremap <Up>   gk
"nnoremap <Right> gl
"nnoremap <Left> gh

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
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy
nnoremap <Space> <Leader>


inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" insertモードでの移動
inoremap <C-i><C-i> <BS>
inoremap <C-b><C-s> <Bslash>
inoremap <A-m> <CR>
inoremap <C-u> <C-g>u<C-u>
inoremap jj <Esc>
inoremap っj jj
inoremap <M-j> <Esc>
"カッコの設定
" inoremap ( ()<Left>
" inoremap { {}<Left>
" inoremap [ []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>
inoremap (<CR> ()<Left><CR><UP><Right><CR>
inoremap {<CR> {}<Left><CR><UP><Right><CR>
inoremap <C-CR> <Esc>$a<CR>

vnoremap v $h

cnoremap <C-a> <Home>
" 一文字戻る
cnoremap <C-b> <Left>
" カーソルの下の文字を削除
cnoremap <C-d> <Del>
" 行末へ移動
cnoremap <C-e> <End>
" 一文字進む
cnoremap <C-f> <Right>
" コマンドライン履歴を一つ進む
cnoremap <C-n> <Down>
" コマンドライン履歴を一つ戻る
cnoremap <C-p> <Up>
" 前の単語へ移動
cnoremap <M-b> <S-Left>
" 次の単語へ移動
cnoremap <M-f> <S-Right>
"---------------------------

" ------dict--------
autocmd FileType tex :set dictionary=~/.vim/dict/tex.dict
" ------------------

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

" -----neocomplete------
let g:neocomplete#enable_at_startup = 1

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ }

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-o>     neocomplete#complete_common_string()
" --------------------

"-------Tree-------
"autocmd vimenter * NERDTree
nnoremap <C-n><C-t> :NERDTree<CR>
let NERDTreeShowHidden = 1
"----------------

" -----unite-------
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" ---------------

" -----indent-----
let g:indent_guides_enable_on_vim_startup = 1
" ---------------

"----hilight--------
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
"-------------------

" -----Quickrun-----
nnoremap <C-q><C-r> :QuickRun
" ---------------

"------neosppenit---------------
" Plugin key-mappings.  " <C-k>でsnippetの展開
imap <C-y> <Plug>(neosnippet_expand_or_jump)
smap <C-y> <Plug>(neosnippet_expand_or_jump)
" 自分用 snippet ファイルの場所 (任意のパス)
let g:neosnippet#snippets_directory = '~/.vim/neosnippets/'
"----------------

"------Scouter------------
function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
command! -bar -bang -nargs=? -complete=file GScouter
\        echo Scouter(empty(<q-args>) ? $MYGVIMRC : expand(<q-args>), <bang>0)
"----------------------------

"--------space-----
" ファイル保存時に余分なスペースを削除する
autocmd BufWritePre * :FixWhitespace
"----------------

"-----ctrp-----
" 検索モードを開く
nmap <Leader>f :CtrlP<CR>
"------------

"----browser-----
" カーソル下のURLや単語をブラウザで開く
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search
"---------------

"----moverapid---
" j/kによる移動を速くする
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
"----------------


" --------tex config--------
function! s:tex()
  inoremap <Sift>_ \
  inoremap $ $$<Left>
endfunction

augroup vimrc-tex
  autocmd!
  autocmd FileType tex call s:tex()
augroup END
"--------------
