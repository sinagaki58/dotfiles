" vim-pulg                                                                                                                                        
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
	let s:vim_plug_dir = expand('~/.vim/plugged/vim-plug')
  if !isdirectory(s:vim_plug_dir)
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
call plug#end()

" InsertモードでEmacsのキーバインドを使えるようにする
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>
inoremap <C-h> <BS>
" NormalモードでEmacsのキーバインドを使えるようにする
nnoremap <C-a> <Home>
nnoremap <C-e> <End>
nnoremap <C-d> <Del>
nnoremap <C-h> <BS>
" ウィンドウ移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" タブ移動
nnoremap sn gt
nnoremap sp gT

set encoding=utf8 " エンコーディング
set t_Co=256  	" vimに色を付ける
set number  		" 行番号を表示
set autoindent  " オートインデント
set incsearch 	" インクリメンタルサーチ
set showmode  	" モードを表示する
set title 			" 編集中のファイル名を表示
set tabstop=2 	" タブのスペース数
set shiftwidth=2  " 改行時のスペース数
set ruler  			" ルーラーの表示
set laststatus=2 " ステータスラインを常に表示
set autoread     " 他でファイルが編集された時に自動で読み込む
set listchars=eol:\ ,trail:-	" 不可視文字を可視化
set wrapscan		" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する
set ignorecase	"	検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase		"	検索文字列に大文字が含まれている場合は区別して検索する
set noincsearch	"	検索文字列入力時に順次対象文字列にヒットさせない

colorscheme molokai
highlight CursorLine ctermfg=White
scriptencoding utf-8
syntax on
filetype plugin indent on

" NERDTree
nnoremap <silent><C-x> :NERDTreeToggle<CR>
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

