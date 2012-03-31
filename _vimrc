set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


set guifont=Monaco:h10
"set guifont=Bitstream_Vera_Sans_Mono:h10
color desert
set nu
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
filetype plugin on
set tabstop=4
set shiftwidth=4
set autoindent
color yytextmate
set nobackup


"== pathogen ==============================================
call pathogen#infect()
call pathogen#helptags()
"== pathogen ==============================================


"========Vim半透明效果，需要vimtweak.dll支持
au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 234)  
"[html] view plaincopyprint?
"几个更改alpha的快捷键  
map <M-8> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 180) <CR>  
map <M-9> <Esc>:call libcallnr("vimtweak.dll", "SetAlpha", 230) <CR>  
map <M-0> <ESC>:call libcallnr("vimtweak.dll", "SetAlpha", 255) <CR>  


""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
if has("win32")                 "设定windows系统中ctags程序的位置
	let Tlist_Ctags_Cmd = 'ctags'
elseif has("linux")              "设定linux系统中ctags程序的位置
	let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
	let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
	let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
	let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口

