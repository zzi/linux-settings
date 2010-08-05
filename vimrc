colorscheme wombat
syntax on


" ########## text options ##########
"set virtualedit=onemore      " allow the cursor to move beyond the last character of a line
set smartindent              " always set smartindenting on
set autoindent               " always set autoindenting on
set copyindent               " always set copyindenting on
set backspace=2              " Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode.
set textwidth=0              " Don't wrap words by default
set shiftwidth=4             " number of spaces to use for each step of indent
set tabstop=4                " number of spaces a tab counts for
set expandtab              " insert spaces instead of tab
set smarttab                 " insert spaces only at the beginning of the line
set softtabstop=4            " backspace deletes 4 spaces if they are tab
set ignorecase               " Do case insensitive matching
set smartcase                " overwrite ignorecase if pattern contains uppercase characters
set formatoptions=lcrqn      " no automatic linebreak
set pastetoggle=<F11>        " put vim in pastemode - usefull for pasting in console-mode
set fileformats=unix	     " favorite fileformats
set encoding=utf-8           " set default-encoding to utf-8
"set iskeyword+=_,-           " these characters also belong to a word
set matchpairs+=<:>          " angle brackets should also being matched by %

"match ErrorMsg '\%>80v.\+'

set cursorline
set cursorcolumn


" ########## visual options ##########
set wildmenu             " When 'wildmenu' is on, command-line completion operates in an enhanced mode.
set wildcharm=<C-Z>      " Shortcut to open the wildmenu when you are in the command mode - it's similar to <C-D>
set showmode             " If in Insert, Replace or Visual mode put a message on the last line.
set guifont=DroidSansMono\ 10 " guifont + fontsize
set guicursor=a:blinkon0 " cursor-blinking off!!
set ruler                " show the cursor position all the time
set nowrap               " kein Zeilenumbruch
set foldmethod=indent    " Standardfaltungsmethode
set foldlevel=99         " default fold level
set winminheight=0       " Minimal Windowheight
set showcmd              " Show (partial) command in status line.
set showmatch            " Show matching brackets.
set matchtime=1          " time to show the matching bracket
set hlsearch             " highlight search
set linebreak            " If on Vim will wrap long lines at a character in 'breakat'
"set showbreak=>>\        " identifier put in front of wrapped lines
"set lazyredraw           " no readraw when running macros
set scrolloff=3          " set X lines to the curors - when moving vertical..
set laststatus=2         " statusline is always visible
set statusline=(%{bufnr('%')})\ %t\ \ %r%m\ #%{expand('#:t')}\ (%{bufnr('#')})%=[%{&fileformat}:%{&fileencoding}:%{&filetype}]\ %l,%c\ %P " statusline
set mouse=a             " mouse only in normal mode support in vim
"set foldcolumn=1        " show folds
set number               " draw linenumbers
set nolist               " list nonprintable characters
set sidescroll=0         " scroll X columns to the side instead of centering the cursor on another screen

" Dictionary
map <F3>  :call TRANSLATE()<cr>
function TRANSLATE()
   let  a=getline('.')
   let co=col('.')-1
   let starts=strridx(a," ",co)
   let ends = stridx(a," ",co)
   if ends==-1
       let ends=strlen(a)
   endif
   let res = strpart(a,starts+1,ends-starts)
   let cmds = "sdcv -n " . res
   let out = system(cmds)
   echo out
endfunction

" Tab autocompletion
function InsertTabWrapper()
   let col = col('.') - 1 
   if !col || getline('.')[col - 1] !~ '\k' 
   	   return "   " 
   else 
   	   return "\<c-p>" 
   endif 
endfunction 
imap <tab> <c-r>=InsertTabWrapper()<cr> 
set complete="" 
set complete+=. 
set complete+=k 
set complete+=b 
set complete+=t 
set completeopt-=preview 
set completeopt+=longest
