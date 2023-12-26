# neovim config for vscode

## 安装

```bash
# mac
brew install neovim

# windows
scoop install neovim
```

## 配置

```bash
# mac
mkdir ~/.config/nvim
cd ~/.config/nvim

# windows
mkdir %HOME%\AppData\Local\nvim
cd %HOME%\AppData\Local\nvim

git clone git@github.com:lfire/vscode-neovim-conf.git
```

## 插件管理：vim-plug

```bash
# mac
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## 安装插件

```vim
" 检查配置
:checkhealth
" 安装插件
:PlugInstall
" 更新插件
:PlugUpdate
" 查看插件状态
:PlugStatus
" 卸载插件
:PlugClean
" 升级 vim-plug 自身
:PlugUpgrade
```

## windows 配置说明

在 windows 下，因 nvim-treesitter 插件存在问题，需要声明以下配置

```lua
-- A list of parser names, or "all" (the five listed parsers should always be installed)
ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
```

请参考：<https://github.com/nvim-treesitter/nvim-treesitter/issues/5536#issuecomment-1806642407>

相关编译问题上，可以参考：<https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support>

其中提到的 mingw / gcc / llvm / zig，最好都安装好，并将相关路径添加到环境变量中。

```bash
scoop install mingw
# ...
```
