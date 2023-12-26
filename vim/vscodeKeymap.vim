" 切换行注释
nnoremap gc <Cmd>call VSCodeNotify('editor.action.commentLine')<CR>
" 切换块注释
nnoremap gC <Cmd>call VSCodeNotify('editor.action.blockComment')<CR>
" 展开所有折叠
nnoremap zR <Cmd>call VSCodeNotify('editor.unfoldAll')<CR>
" 关闭所有折叠
nnoremap zM <Cmd>call VSCodeNotify('editor.foldAll')<CR>
" 展开当下折叠
nnoremap zo <Cmd>call VSCodeNotify('editor.unfold')<CR>
nnoremap <silent> zO <Cmd>call VSCodeNotify('editor.unfoldRecursively')<CR>
" 关闭当下折叠
nnoremap zc <Cmd>call VSCodeNotify('editor.fold')<CR>
nnoremap <silent> zC <Cmd>call VSCodeNotify('editor.foldRecursively')<CR>
" 选择html tag
nnoremap <silent> vit <Cmd>call VSCodeNotify('editor.emmet.action.balanceIn')<CR>
nnoremap <silent> vat <Cmd>call VSCodeNotify('editor.emmet.action.balanceOut')<CR>
" 切换当下折叠
nnoremap za <Cmd>call VSCodeNotify('editor.toggleFold')<CR>
" 折叠层级
nnoremap <silent> z1 <Cmd>call VSCodeNotify('editor.foldLevel1')<CR>
nnoremap <silent> z2 <Cmd>call VSCodeNotify('editor.foldLevel2')<CR>
nnoremap <silent> z3 <Cmd>call VSCodeNotify('editor.foldLevel3')<CR>
nnoremap <silent> z4 <Cmd>call VSCodeNotify('editor.foldLevel4')<CR>
nnoremap <silent> z5 <Cmd>call VSCodeNotify('editor.foldLevel5')<CR>
nnoremap <silent> z6 <Cmd>call VSCodeNotify('editor.foldLevel6')<CR>
nnoremap <silent> z7 <Cmd>call VSCodeNotify('editor.foldLevel7')<CR>
" 折叠其他所有除选中的部分
nnoremap <silent> ze <Cmd>call VSCodeNotify('editor.foldAllExcept')<CR>
" 折叠跳转
nnoremap <silent> zj <Cmd>call VSCodeNotify('editor.gotoNextFold')<CR>
nnoremap <silent> zk <Cmd>call VSCodeNotify('editor.gotoPreviousFold')<CR>
" 
" 转到文件中上一个问题
nnoremap g[ <Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>
" 转到文件中下一个问题
nnoremap g] <Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
" 用H替换掉^
" noremap H ^
" 用L替换掉$
" noremap L $
" 使用vscode的undo替换nvim的undo
nnoremap u <Cmd>call VSCodeNotify('undo')<CR>

" nnoremap <silent> L <Cmd>call VSCodeExtensionNotify('reveal', 'bottom', 0)<CR>
" nnoremap <silent> H <Cmd>call VSCodeExtensionNotify('reveal', 'top', 0)<CR>
" nnoremap <silent> M <Cmd>call VSCodeExtensionNotify('reveal', 'center', 0)<CR>