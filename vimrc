set encoding=utf8
scriptencoding utf-8  " encoding

syntax on
colorscheme elflord

set t_Co=256  " vimに色を付ける
set number  " 行番号を表示
set autoindent  " オートインデント
set incsearch " インクリメンタルサーチ
set showmode  " モードを表示する
set title " 編集中のファイル名を表示
set tabstop=2 " タブのスペース数
inoremap <silent> jj <ESC> " jjでesc
set ruler  " ルーラーの表示
set laststatus=2            " ステータスラインを常に表示
set autoread                " 他でファイルが編集された時に自動で読み込む
set listchars=eol:\ ,trail:-  " 不可視文字を可視化

highlight CursorLine ctermbg=Blue
highlight CursorLine ctermfg=White

set wrapscan
set ignorecase   "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase    "検索文字列に大文字が含まれている場合は区別して検索する
set noincsearch  "検索文字列入力時に順次対象文字列にヒットさせない

nnoremap <Space>h  ^
nnoremap <Space>l  $
