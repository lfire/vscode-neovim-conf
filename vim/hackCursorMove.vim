" 重建 gj gk 键
lua require('hackKeymap')

" 支持 visual 模式下移动光标跳过折叠段
" vnoremap gj <Cmd>call VSCodeCall('cursorDown')<CR>
" vnoremap gk <Cmd>call VSCodeCall('cursorUp')<CR>
" 等同上两个但报错
" vnoremap gk :<C-u>call VSCodeCall('cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'select': 'true', 'value': v:count ? v:count : 1 })<CR>
" vnoremap gj :<C-u>call VSCodeCall('cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'select': 'true', 'value': v:count ? v:count : 1 })<CR>

" 支持移动光标跳过折叠段
" 方案一：影响类似 10j
" nnoremap gj <Cmd>call VSCodeCall('cursorDown')<CR>
" nnoremap gk <Cmd>call VSCodeCall('cursorUp')<CR>

" 方案二：不影响 10j
function! MoveCursor(direction) " abort
  let l:count = v:count1
  " echo l:count . ' | ' . reg_recording() . ' | ' . reg_executing() . ' | ' . mode()
  " 不是 10j 且不在录制宏 且不在执行宏
  if l:count == 1 && reg_recording() == '' && reg_executing() == ''
    " 转换为 gj gk，实现跳过折叠段
    " call VSCodeCall('cursorDown')
    return 'g'.a:direction
  else
    " 执行原来的 j 键的功能
    " execute "normal! " . l:count . "j"
    return a:direction
  endif
endfunction
map <expr> j MoveCursor('j')
map <expr> k MoveCursor('k')