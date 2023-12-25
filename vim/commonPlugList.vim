" 定义公共插件函数
" better syntax support
" Plug 'sheerun/vim-polyglot'
" file explorer
" Plug 'scrooloose/NERDTree'
" auto pairs for ( [ {
" Plug 'jiangmiao/auto-pairs'
" 快速跳转
Plug 'asvetliakov/vim-easymotion'
Plug 'ggandor/leap.nvim'
" 查找
Plug 'ggandor/flit.nvim'
" 包裹修改 () {} [] <> '' "" ``
Plug 'tpope/vim-surround'
" html标签匹配，% 跳转
Plug 'andymass/vim-matchup'
" 单词处理相关
" Press crs (coerce to snake_case). MixedCase (crm), camelCase (crc), UPPER_CASE (cru), dash-case (cr-), and dot.case (cr.) are all just 3 keystrokes away
Plug 'tpope/vim-abolish'
" 折叠 & 高亮
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" 文档查找跳转：两个字符查找并跳转，s{char}{char}
" Plug 'justinmk/vim-sneak'
" 标签成对编辑
Plug 'windwp/nvim-ts-autotag'