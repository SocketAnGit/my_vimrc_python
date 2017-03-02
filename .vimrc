set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"To keep foldmethod effective
Plugin 'tmhedberg/SimpylFold'
"Auto PEP8
Plugin 'vim-scripts/indentpython.vim'
"Auto complete
"syntastic highlight
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
let python_hightlight_all=1
syntax on
"text font colors
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

"File oberview
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\pyc$','\~$'] "ignor files in NERDTree
"super research
Plugin 'kien/ctrlp.vim'
"add git
"Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix |

au BufNewFile,BufRead *.js,*.html,*.css
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2 |

"split the window and do more geek things
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Enable folding
set foldmethod=indent
set foldlevel=99
"Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
"observe the whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h, match BadWhitespace /\s\+$/
"support utf-8
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"table encoding
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"consle output encoding
language messages zh_CN.utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,latin1

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAl_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(_file___=activeate_this))
EOF

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" All of your Plugins must be added before the following line
filetype plugin indent on    " required
" All of your Plugins must be added before the following line
filetype plugin indent on    " required
" All of your Plugins must be added before the following line
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

syntax enable
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme Zenburn
endif
call togglebg#map("<F5>")


