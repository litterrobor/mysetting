" my vimrc

"all about Plug install
"2019年 11月 26日 星期二 11:18:30 CST screenshot
"vimwiki
"screenshot
call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'

" Markdown
" 2019年 11月 26日 星期二 18:32:15 CST
Plug 'iamcco/markdown-preview.nvim', {  'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'theniceboy/bullets.vim'
Plug 'vim-aireline/vim-aireline'
call plug#end()



"all about Plug set
"2019年 11月 26日 星期二 11:33:51 CST
"vimwiki set
set nocompatible
filetype plugin on
syntax on

"markdown-preview  set
"2019年 11月 26日 星期二 18:14:35 CST
"
"markdown settings
"sinppets
source ~/.config/nvim/md-snippets.vim
" auto spell
" autocmd BufRead,BufNewFile *.md setlocal spell




" === all about Editor behavior 编辑器习惯设置
" 2019年 11月 26日 星期二 23:45:10 CST
" ===

set incsearch
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
"实时显示按键记录
set showcmd
"命令行补全
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.



"all about hot key
"2019年 11月 26日 星期二 11:42:21 CST
"Save & quite
map S :w<CR>
map Q :q<CR>
map e :source $MYVIMRC<CR>

" Disable the default s key 关闭s键位功能 
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)分屏
" 2019年 11月 26日 星期二 23:17:22 CST
noremap sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sj :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

map <LEADER>l <C-w>h
map <LEADER>h <C-w>h
map <LEADER>k <C-w>k 
map <LEADER>h <C-w>h 

" Compile function  auto markdown
"2019年 11月 26日 星期二 18:30:33 CST
noremap R :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!google-chrome % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc
