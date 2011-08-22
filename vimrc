" Sexy vim configs with pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" No Vi Compatibility. That just sucks.
set nocompatible

" Fix backspace indentation
set backspace=indent,eol,start


" Convince Vim it can use 256 colors inside Gnome Terminal.
" Needs CSApprox plugin
set t_Co=256

" Menus I like :-)
" This must happen before the syntax system is enabled
" aunmenu Help.
" aunmenu Window.
let no_buffers_menu=1

" Enable mouse everywhere
set mouse=a

" Hide mouse pointer while typing
set mousehide
set mousemodel=popup

" Code Folding, everything folded by default
set foldmethod=indent
set foldlevel=99
set foldenable

" Make mouse middle click paste without formatting it.
map <MouseMiddle> <Esc>"*p

" Better modes.  Remeber where we are, support yankring
" set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo

" Move Backup Files to ~/.vim/sessions
"set backupdir=~/.vim/sessions
"set dir=~/.vim/sessions

" Turn off annoying swapfiles
" set noswapfile

"" Enable Syntax Colors
"syntax on
"if has("gui_running")
"  set guifont=Mensch\ 10
"else
"  colorscheme mustang
"endif

syntax enable
set background=light
colorscheme solarized
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"call togglebg#map("<F5>")

" Set fixed height widht of gvim windowset background=dark
" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" Set <leader> to ',' and <localleader> to "\"
let mapleader=","
let maplocalleader="\\"

noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" <F1> and <F2> for save in all three modes
noremap  <F1> <Esc>:w<CR>
inoremap <F1> <Esc>:w<CR>
nnoremap <F1> <Esc>:w<CR>
vnoremap <F1> <Esc>:w<CR>

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F\ -\ Vim

" Enable filetype plugins and indention
filetype on
filetype plugin on

" Activate a permanent ruler
set ruler

" Disable Toolbar, Scrollbar
set guioptions-=T
set guioptions-=r

" Disable the blinking cursor.
set gcr=a:blinkon0

" Highlight current line
if has("gui_running")
  set cursorline
endif

set ttyfast

" Customize the wildmenu
set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class
set wildmode=list:full

" Go with smartindent if there is no plugin indent file.
set autoindent  smartindent
" But don't outdent hashes
inoremap # X#

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" <leader>v selects the just pasted text
nnoremap <leader>v V`]

" Copy/Paste to and from Desktop Environment
noremap <leader>yy "+y
noremap <leader>pp "+gP

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" NERDtree on <leader>t
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" Make the command line two lines high and change the statusline display to
" something that looks useful.
set cmdheight=2
set laststatus=2
"set statusline=[%l,%v\ %P%M][CWD:\ %{CWD()}][FILE:\ %f]\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}\ %#warningmsg#%{SyntasticStatuslineFlag()}%*
set showcmd
set showmode
set number

function! CWD()
    let curdir = substitute(getcwd(), '/home/andresmh', "~/", "g")
    return curdir
endfunction

" Tab Settings
set smarttab
set tabstop=8

" Taglist
"let Tlist_Compact_Format = 1
"let Tlist_Ctags_Cmd = 'ctags'
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Exist_OnlyWindow = 1
"let Tlist_File_Fold_Auto_Close = 0
"let Tlist_sort_type = "name"
"let Tlist_Use_Right_Window = 1
"let TlistHighlightTag = 1
"let Tlist_Width = 40
"let Tlist_GainFocus_On_ToggleOpen = 1
"nnoremap <leader>l :Tlist<CR>

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

" GUI Tab settings
function! GuiTabLabel()
  let label = ''
  let buflist = tabpagebuflist(v:lnum)
  if exists('t:title')
    let label .= t:title . ' '
  endif
  let label .= '[' . bufname(buflist[tabpagewinnr(v:lnum) - 1]) . ']'
  for bufnr in buflist
    if getbufvar(bufnr, '&modified')
      let label .= '+'
      break
    endif
  endfor
  return label
endfunction
set guitablabel=%{GuiTabLabel()}

" Gvim Settings

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" utf-8 default encoding
set enc=utf-8

" Prefer unix over windows over os9 formats
set fileformats=unix,dos,mac

" Don't bell or blink(Courtesy: Cream Editor).
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

" Keep some more lines for scope
set scrolloff=5

" hide some files and remove stupid help
let g:netrw_list_hide='^\.,.\(pyc\|pyo\|o\)$'

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

