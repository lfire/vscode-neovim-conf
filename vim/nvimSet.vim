" 以正常模式启动nvim时加载的配置项
" 显示行号
set number
" 设置相对行号
set relativenumber
" 设置行宽
set textwidth=80
" 设置自动换行
set wrap
" 是否显示状态栏
set laststatus=2
" 语法高亮
syntax off
" 支持鼠标
set mouse=a
" 设置编码格式
set encoding=utf-8
" 启用256色
set t_Co=256
" 开启文件类型检查
filetype indent off
" 设置自动缩进
" set autoindent
" 设置tab缩进数量
set tabstop=4
" 设置>>与<<的缩进数量
set shiftwidth=4
" 将缩进转换为空格
set expandtab
" 自动高亮匹配符号
set showmatch
" 自动高亮匹配搜索结果
set nohlsearch
" 开启逐行搜索，也就是说按下一次按键就继续一次搜索
set incsearch
" 开启类型检查
" set spell spelllang
" 开启命令补全
set wildmenu
" 不创建备份文件
set nobackup
" 不创建交换文件
set noswapfile
" 多窗口下光标移动到其他窗口时自动切换工作目录
set autochdir
" 初始不折叠
" set nofoldenable
" 折叠
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
set scrolloff=5
