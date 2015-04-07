""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mintainer:
"    Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version:
"       5.0 - 29/05/12 15:43:36
"
" Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version:
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

scriptencoding utf-8
set encoding=utf-8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=200

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" Replace word with last yank
nnoremap <leader>p   "_diwP
" grep for under under the cursor in the current file
nnoremap <leader>f   vimgrep <C-R>=expand("<cword>")<CR> %<CR>
" go to previous quick fix item
nnoremap <leader>k   :cp<CR>
" go to next quick fix item
nnoremap <leader>j   :cn<CR>

" Reload file and go to end, useful for reading logs that are updating
nnoremap <leader>r   :e \| normal G<CR>

" make yanking consistent with other commands
nnoremap Y y$

" Enable cscope queries to go into the quickfix window
:set cscopequickfix=s-

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
" set so=7

" Show Line numbers
set number
" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
"set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
" set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set t_Co=256

" Highlight current line
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
"
" Set extra options when running in GUI mode
if has("gui_running")
    set t_Co=256
    set guitablabel=%M\ %t
endif

colorscheme wombat256
set background=dark

" Speeds up large file handling
set synmaxcol=256

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set foldmethod=syntax
set foldlevel=20
set nofoldenable

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards searc)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader>n :noh<cr>

" Smart way to move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Close window more easily
nmap <C-q> :close<CR>

" Position QuickFix window on bottom across all windows
autocmd FileType qf wincmd J

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
"map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
nnoremap <leader>te :tabnew<cr>
nnoremap <leader>tb :tabnew %<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
"map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry

" Return to last edit position when opening files (You want this!)
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif
" Remember info about open buffers on close
"set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
"set laststatus=1

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

set laststatus=2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.cpp :call DeleteTrailingWS()
autocmd BufWrite *.h :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
" vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
"map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
"map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
"vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
"map <leader>cc :botright cope<cr>
"map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
"map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
"map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

set nocompatible               " be iMproved
filetype off                   " required!

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

call neobundle#end()

" My Bundles here:
"
" original repos on github
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'FuzzyFinder'
NeoBundle 'bling/vim-airline'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'sk1418/QFGrep'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'FelikZ/ctrlp-py-matcher'
NeoBundle 'ironhouzi/vim-stim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'vasconcelloslf/vim-interestingwords'
NeoBundle 'rking/ag.vim'

" Bundle 'Valloric/YouCompleteMe'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'jlanzarotta/bufexplorer'
" Bundle 'majutsushi/tagbar'
" Bundle 'mrafcho001/simple_bookmarks.vim'
" Bundle 'perforce.vim'
" Bundle 'scrooloose/nerdcommenter'
" Bundle 'sjl/gundo.vim'      -- Replaced by undotree
" Bundle 'ton/vim-bufsurf'
" Bundle 'xolox/vim-easytags'
" Bundle 'xolox/vim-misc'


" Github repos of the user 'vim-scripts'
" => can omit the username part
NeoBundle 'L9'


filetype plugin indent on     " required!

NeoBundleCheck

" Plugin stuff
nmap <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=1

nnoremap <F5> :UndotreeToggle<cr>

" nmap <F8> :TagbarToggle<CR>
" let g:tagbar_usearrows = 1

nmap <C-g> :FufBuffer<CR>
nmap <C-s> :FufBufferTag<CR>


" CtrlP Configs
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_regexp = 1
" let g:ctrlp_root_markers = ['lte', '.p4env', '.ctrlp']
" let g:ctrlp_use_caching = 1
" let g:ctrlp_max_files = 0
" let g:ctrlp_open_new_file = 'r'
" let g:ctrlp_custom_ignore = 'build'
" CtrlP Py Matches
if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag -g "" -l -i --nocolor %s'
else
    echo 'Could not find ag, using default ctrlp filename list generator'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Overwrite Plug-in 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filename related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>cs :let @*=expand("%:p")<CR>
