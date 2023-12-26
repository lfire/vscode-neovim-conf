let g:confPath = $HOME . "/.config/nvim/"
if has('win32')
    let g:confPath = $HOME . "/AppData/Local/nvim/"
endif

" 默认插件
" execute "source " . g:confPath . "vim-plug/plugins.vim"

" 当打开nvim时，若没有下载vim-plug则自动下载
if empty(glob(g:confPath . 'autoload/plug.vim'))
    " silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    execute "silent !curl -fLo " . g:confPath . "autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 始终都会加载的配置项
let mapleader = "\<space>"
" 使用系统剪切板
" set clipboard=unnamed
" 忽略大小写
set ignorecase
set matchpairs+=<:>

" 自动切换输入法
if executable('im-select')
    if has('win32')
        autocmd InsertLeave * :call system("im-select 1033")
        autocmd CmdlineLeave * :call system("im-select 1033")
    else
        autocmd InsertLeave * :call system("im-select com.apple.keylayout.ABC")
        autocmd CmdlineLeave * :call system("im-select com.apple.keylayout.ABC")
    endif
endif

" ----- settings ----
if exists('g:vscode')
    " hack vscode keymap
    " source $HOME/.config/nvim/vim/hackCursorMove.vim
    " 存在bug，暂时不用
    " execute "source " . g:confPath . "vim/hackCursorMove.vim"
    lua require('hackKeymap')
    " ----- Plug only for vscode -----
    call plug#begin(g:confPath . 'autoload/plugged')
        " 光标跳转折叠行
        " Plug 'xiyaowong/fast-cursor-move.nvim'

        " 调用公共插件函数
        execute "source " . g:confPath . "vim/commonPlug.vim"
        let g:commonPlugins = GetCommonPlugins()
        for plugin in g:commonPlugins
            Plug plugin
        endfor
        execute "source " . g:confPath . "vim/commonPlugList.vim"
    call plug#end()
    execute "source " . g:confPath . "vim/vscodeKeymap.vim"
else
    execute "source " . g:confPath . "vim/nvimSet.vim"
    " ----- Plug for neovim -----
    call plug#begin(g:confPath . 'autoload/plugged')
        " vim中文文档
        Plug 'yianwillis/vimcdoc'
        " 颜色插件
        Plug 'theniceboy/vim-deus'
        " 根据内容自动获取文件类型
        Plug 'Shougo/context_filetype.vim'
        " 自动进行注释
        Plug 'tyru/caw.vim'
        " 多光标模式操作
        Plug 'mg979/vim-visual-multi', {'branch': 'master'}

        " 调用公共插件函数
        execute "source " . g:confPath . "vim/commonPlug.vim"
        let g:commonPlugins = GetCommonPlugins()
        for plugin in g:commonPlugins
            Plug plugin
        endfor
        execute "source " . g:confPath . "vim/commonPlugList.vim"
    call plug#end()
    " -- ctrl+/设置为打开、关闭注释
    if has('win32')
        nmap <C-/> gcc
        vmap <C-/> gcc
    else
        nmap <C-_> gcc
        vmap <C-_> gcc
    endif
    " 按键映射前缀: <leader>v。
    " let g:VM_maps = {}                 "取消默认按键映射。
    " let g:VM_maps['Find Under'] = 'gb' "进入多光标模式并选中光标下字符串。
endif

" easymotion相关配置
let g:EasyMotion_smartcase = 0
" easymotion前缀 leader leader
map <Leader> <Plug>(easymotion-prefix)
" 其他键位绑定
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>w <Plug>(easyotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

lua require('conf')
