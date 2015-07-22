syntax on
colorscheme ron

set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set number " 行番号の表示
set showmatch " 対応する括弧などをハイライト表示
set matchpairs& matchpairs+=<:> " 対応括弧に'<'と'>'のペアを追加
set hlsearch " 検索結果をハイライト表示


let NERDTreeShowHidden = 1

" release autogroup in MyAutoCmd
augroup MyAutoCmd
    autocmd!
augroup END

" 括弧の自動補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <ESC>
inoremap <silent> kk <ESC>

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" カーソル前の文字削除
inoremap <silent> hh <C-g>u<C-h>

nnoremap qq :q<cr>

" ヤンクしたものを検索する
nnoremap <C-p> /<C-r>"

" 行末、行頭移動
nnoremap <C-h> 0
nnoremap <C-l> $

" 単語コピー
nnoremap <C-w> viwy

"prefix keyの設定
nmap ,u [unite]

" ------------ファイル操作で活用--------------
" ウィンドウ横分割
nnoremap ss :vsp<cr>
" ウィンドウ縦分割
nnoremap sd :split<cr>
" 次のウィンドウへ移動
nnoremap ww <C-w>w
" ウィンドウへ左右上下移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l





" 右のタブへ移動(sublimeの設定と同じにしたい)
nnoremap <C-m> gt
" 左のタブへ移動(sublimeの設定と同じにしたい)
nnoremap <C-n> gT

"" ---【Unite.vim関連】---

" ファイル一覧
nnoremap <silent> [unite]f :<C-u>Unite file<CR>
" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"------------------------

" grep検索(カレントディレクトリ以下),検索後はバッファに保存してあるので、再検索は速い(,r)
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>


" -------------------------------------------

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" command(ここctrlにしたい)+ eでnerdtreeを開けるショートカット
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" command(ここctrlにしたい)+ eでnerdtreeを開けるショートカット
nnoremap <silent><C-r> :QuickRuntoggle<cr>

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" vi互換を無効化する。vi互換を有効化していると、Vimに与える影響が大きくなり、ほとんどのVimプラグインが使えなくなる。なので無効化
set nocompatible
if has('vim_starting')
    " bundleで管理するディレクトリを指定。追加するプラグインは全てこの指定しているディレクトリ以下に入る
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" Required
call neobundle#begin(expand('~/.vim/bundle/'))
" neobundle自体をneobundleで管理
NeoBundle 'Shougo/neobundle.vim'

" --------------------------------------ここにプラグインを追加していく------------------------------------------

" データを簡単に操作できる(ファイル一覧見たり・・)
NeoBundle 'Shougo/unite.vim'

" ファイル・ディレクトリツリーを左側に表示できる
" 使い方 :NERDTree
" ショートカット| 機能
" CD | カレントバッファに移動 
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }

NeoBundle 'Shougo/vimfiler.vim'
"NeoBundle 'osyo-manga/unite-qfixhowm'

" 実行確認(遅延ロード)

" --------------------------------------------------------------------------------------------------


" solarized カラースキーム
 NeoBundle 'altercation/vim-colors-solarized'
" mustang カラースキーム
NeoBundle 'croaker/mustang-vim'
" wombat カラースキーム
NeoBundle 'jeffreyiacono/vim-colors-wombat'
" jellybeans カラースキーム
 NeoBundle 'nanotech/jellybeans.vim'
" lucius カラースキーム
NeoBundle 'vim-scripts/Lucius'
" zenburn カラースキーム
NeoBundle 'vim-scripts/Zenburn'
" mrkn256 カラースキーム
NeoBundle 'mrkn/mrkn256.vim'
" railscasts カラースキーム
NeoBundle 'jpo/vim-railscasts-theme'
" pyte カラースキーム
NeoBundle 'therubymug/vim-pyte'
" molokai カラースキーム
NeoBundle 'tomasr/molokai'

" カラースキーム表示確認
NeoBundle 'ujihisa/unite-colorscheme'


call neobundle#end()
filetype plugin indent on


" 未インストールのプラグインが有る場合、尋ねてくれる
NeoBundleCheck
