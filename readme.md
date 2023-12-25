# neovim

## 安装

```bash
brew install neovim
```

## 配置

```bash
# mac
mkdir ~/.config/nvim
cd ~/.config/nvim

# windows
mkdir ~/AppData/Local/nvim
cd ~/AppData/Local/nvim

git clone git@github.com:lfire/vscode-neovim-conf.git
```

## 插件管理：vim-plug

```bash
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
