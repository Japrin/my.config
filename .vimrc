" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2014 Nov 05
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" The bundles you install will be listed here
Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'klen/python-mode'
"Plugin 'jcfaria/Vim-R-plugin'
"Plugin 'jalvesaq/Nvim-R'

execute pathogen#infect()


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file (restore to previous version)
"  set undofile		" keep an undo file (undo changes after closing)
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

"Set mapleader
"let mapleader = ","
""Fast reloading of the .vimrc
map <silent> <leader>ss :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e ~/.vimrc<cr>
""When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc 

set sessionoptions-=curdir  
set sessionoptions+=sesdir

""""""""""""""""""""""""""""""
" Taglist
" """"""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_Auto_Open = 1
let Tlist_File_Fold_Auto_Close = 1 
"let Tlist_Close_On_Select = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Process_File_Always = 1
map <silent> <F9> :TlistToggle<cr> 

""""""""""""""""""""""""""""""
" BufExplorer
" """"""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

""""""""""""""""""""""""""""""
" NERDTree
" """"""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" winManager setting
" """"""""""""""""""""""""""""""
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr> 

""""""""""""""""""""""""""""""
" superTab setting
" """"""""""""""""""""""""""""""
let g:SuperTabRetainCompletionType = 1
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

""""""""""""""""""""""""""""""
" showmarks setting
" """"""""""""""""""""""""""""""
" " Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1 

""""""""""""""""""""""""""""""
" folding
" """"""""""""""""""""""""""""""
set foldenable
"autocmd FileType c,cpp  setl fdm=syntax | setl fen 

colorscheme default_my

""""""""""""""""""""""""""""""
" R plugins and RMarkdonn
" """"""""""""""""""""""""""""""
function! RMakeHTML_2()
  update
  call RSetWD()
  let filename = expand("%:r:t")
  let rcmd = "require('knitrBootstrap');
    \knit_bootstrap(\"" . filename . ".Rmd\")"
  if g:vimrplugin_openhtml
    let rcmd = rcmd . '; browseURL("' . filename . '.html")'
  endif
  call g:SendCmdToR(rcmd)
endfunction
"bind RMakeHTML_2 to leader kk
nnoremap <silent> <Leader>kk :call RMakeHTML_2()<CR>

let R_in_buffer = 0
map <LocalLeader>nc :call RAction("colnames")<CR>
map <LocalLeader>n2 :call RAction("names")<CR>
map <LocalLeader>nh :call RAction("head")<CR>
map <LocalLeader>nd :call RAction("dim")<CR>
""""map <LocalLeader>cc :call RAction("class")<CR>
map <LocalLeader>sb :call SendCmdToR("system.time({")<CR>
map <LocalLeader>se :call SendCmdToR("})")<CR>



""""""""""""""""""""""""""""""
" python
" """"""""""""""""""""""""""""""
augroup vimrc_autocmds
    au!
    " highlight characters past column 80
    autocmd FileType python highlight OverLength ctermbg=DarkGrey guibg=Black
    autocmd FileType python match OverLength /\%80v.*/
    "autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    "autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set colorcolumn=""
    "autocmd FileType python set colorcolumn=80
    autocmd FileType python set nowrap
augroup END
" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
set term=xterm-256color
"set t_Co=256
" set termencoding=utf-8
" set guifont=Ubuntu\ Mono\ derivative\ Powerline:10
let g:Powerline_symbols = 'fancy'
set encoding=utf-8

""""""""""""""""""""""""""""""
" python-mode
" """"""""""""""""""""""""""""""
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator " modes)
" ]]            Jump on next class or function (normal, visual, operator " modes)
" [M            Jump on previous class or method (normal, visual, operator " modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pep8_ignore="E501,W601"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

""""""""""""""""""""""""""""""
" slime
" """"""""""""""""""""""""""""""
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1

""""""""""""""""""""""""""""""
" screen
" """"""""""""""""""""""""""""""
" !!!!! make sure no windows have name as 'screenshell' !!!!!
let g:ScreenImpl = "Tmux"
autocmd FileType python map <LocalLeader>rf :ScreenShell! ipython3<CR>
autocmd FileType python map <LocalLeader>rrf :ScreenShell! ipython<CR>
autocmd FileType python map <LocalLeader>rq :ScreenQuit<CR>
" Send current line to python and move to next line.
autocmd FileType python map <LocalLeader>n V:ScreenSend<CR>j
" Send current line to python
autocmd FileType python map <LocalLeader>l V:ScreenSend<CR>
" Send visual selection to python and move to next line.
autocmd FileType python map <LocalLeader>ss :ScreenSend<CR>`>0j

""""""""""""""""""""""""""""""
" other things
" """"""""""""""""""""""""""""""
" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
" automatically change window's cwd to file's dir
set autochdir
" I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

set clipboard=exclude:.*



