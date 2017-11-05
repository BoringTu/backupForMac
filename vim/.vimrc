set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
language messages zh_CN.utf-8

set nocompatible
set number
set relativenumber
filetype on 
set history=1000 
syntax on 
set autoindent
"set smartindent
set showmatch
set guioptions=T
set vb t_vb=
set ruler
set incsearch
set cursorline
set hlsearch
set clipboard=unnamed
set fdm=indent
set foldlevel=999
"set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容

set tabstop=4
set shiftwidth=4
if has ( "autocmd" )
	autocmd FileType html setlocal ts=2 sw=2
	autocmd FileType css setlocal ts=2 sw=2
	autocmd FileType less setlocal ts=2 sw=2
endif

set list
set listchars=tab:▸\ ,trail:·,precedes:«,extends:»

set nobackup

au BufNewFile,BufRead *.tpl set filetype=html
au BufNewFile,BufRead *.hbs set filetype=html
au BufNewFile,BufRead *.handlebars set filetype=html

" n	常规模式
" v	可视化模式
" o	运算符模式
" !	插入模式，命令行模式
" i	插入模式
" c	命令模式

"map <C-a> ggVG
"nmap f :find
"imap <C-i> <Esc> " 无效，不知道为啥
" js文本添加/去掉注释
" 注释（可多行：Shift-v）
nmap == 0i//<Esc>
vmap == <C-v>0I//<Esc>
" 暂时只能做到单行去注释
map -- ^xx
"map == I// <Esc>
"map -- 0xx

" 缩进文本
"nmap <Tab> V>	" 设置之后会使Ctrl-i（莫名其妙的）映射到Tab上，好像还有其他bug
"nmap <S-Tab> V<
" (Shift-v模式下）
vmap <Tab> >gv
vmap <S-Tab> <gv

"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i
"inoremap < <><ESC>i
"inoremap { {}<ESC>i
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i


set backspace=indent,eol,start

colorscheme distinguished


set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
call vundle#rc()
Plugin 'airblade/vim-gitgutter'	" 设置实时更新状态不生效
"let g:gitgutter_highlight_lines = 1
"Plugin 'mhinz/vim-signify'	"没啥卵用，而且设置实时也不生效
"Plugin 'YouCompleteMe'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
map <C-n> :NERDTreeToggle<CR>
filetype plugin indent on

" 自动补全配置
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<C-d>', '<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<C-u>', '<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	"从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
""在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

"imap <C-d> <Down>
"imap <C-u> x
"imap <C-u> <Up>

let @l="oconsole.log('');hhi"

iabbrev adn and


