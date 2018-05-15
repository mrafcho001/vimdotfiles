""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mintainer:
"    Martin Bakiev
"       https://github.com/mrafcho001/vimdotfiles
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable mouse in terminal, and use the '+' register for clipboard
set clipboard+=unnamedplus
set mouse=a

" Tell neovim where to find python. Installation & system dependent
let g:python_host_prog = '/Users/mrafcho001/Development/neovim-env/py2/bin/python'
let g:python3_host_prog = '/Users/mrafcho001/Development/neovim-env/py3/bin/python'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Use spacebar as leader
let mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" Replace word with last yank or specified register
" replaced text is discarded ('_' register)
nnoremap <expr> <leader>p   '"_ciw<C-r>' . v:register . '<ESC>'

" TODO: GrepperAg & vimgrep for "global" & buffer searches
" grep for under under the cursor in the current file
nnoremap <leader>f   :vimgrep <C-R>=expand("<cword>")<CR> %<CR>

" go to previous quick fix item or previous change in diffmode
nnoremap <expr> <leader>k   &diff ? '[c' : ':cp<CR>'

" go to next quick fix item or go to next change in diffmode 
nnoremap <expr> <leader>j   &diff ? ']c' : ':cn<CR>'

" Reload file and go to end, useful for reading logs that are updating
nnoremap <leader>r   :e \| normal G<CR>

" Try to jump to tag stored in clipboard (register ")
nnoremap <leader>tj  :tag <C-r>+<CR>

" make yanking consistent with other commands
nnoremap Y y$

" Jumping to marked column is more useful than just jumping to marked line
nnoremap ' `
nnoremap ` '

" Keep visual selection after indentation
vnoremap > >gv
vnoremap < <gv

" Joining lines does not move cursor
nnoremap J mzJ`z

" Make arrow keys do something useful
nnoremap <left> :vertical resize +2<CR>
nnoremap <right> :vertical resize -2<CR>
nnoremap <up> :resize +2<CR>
nnoremap <down> :resize -2<CR>


" Enable cscope queries to go into the quickfix window
:set cscopequickfix=s-

" Ignore whitespace changes in diffs
set diffopt+=iwhite
set diffexpr=DiffW()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show Line numbers
set number

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" A buffer becomes hidden when it is abandoned
set hid

set cinoptions+=(0

" Ignore casing when search term is lowercase, otherwise respect casing
set ignorecase
set smartcase

" For regular expressions turn magic on
set magic

" Highlight current line
set cursorline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set extra options when running in GUI mode
if has("gui_running")
    set guitablabel=%M\ %t
endif

let g:rehash256 = 1
colorscheme molokai

" Speeds up large file handling
set synmaxcol=256

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

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
set lbr
set breakindent
let &showbreak = '↳'
set cpo+=n

set ai "Auto indent
set wrap "Wrap lines

set foldmethod=indent
set foldlevel=20
set nofoldenable

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Disable highlight when <leader><n> is pressed
map  <leader>n :set nohlsearch!<cr>

" Smart way to move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <BS> <C-W>h
nmap <C-l> <C-W>l

" Close window more easily
nmap <C-q> :close<CR>

" Position QuickFix window on bottom across all windows
autocmd FileType qf wincmd J

" Close the current buffer
map <leader>bd :Bclose<cr>

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Searching related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
nnoremap 0 ^
nnoremap ^ 0

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

" Delete trailing white space on save (use carefully on old codebases)
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
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing <leader>ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


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


" Use -w instead of -b for ignore case, -b (vim default) only ignores trailing space
function DiffW()
  let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-w " " vim uses -b by default
   endif
   silent execute "!diff -a --binary " . opt .
     \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Plugin related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" My Bundles here:
"
" original repos on github
Plug 'Konfekt/FastFold'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'bling/vim-airline'
Plug 'AndrewRadev/linediff.vim'
Plug 'mbbill/undotree'
Plug 'sk1418/QFGrep'
Plug 'ironhouzi/vim-stim'
Plug 'vasconcelloslf/vim-interestingwords'
Plug 'rking/ag.vim'
Plug 'mhinz/vim-grepper'
Plug 'milkypostman/vim-togglelist'
Plug 'justinmk/vim-syntax-extra'
Plug 'unblevable/quick-scope'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'mhinz/vim-signify'

call plug#end()

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

vnoremap <leader>av :EasyAlign-/[ *]/r0<CR>

" NerdTree
nmap <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=1

" undotretree
nnoremap <F5> :UndotreeToggle<cr>

" CtrlP Configs
nmap <C-g> :CtrlPBuffer<CR>
nmap <C-s> :CtrlPBufTag<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP :pwd'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = 'build\|BS_ENV\|dist\|htmlcov\|rpmout\|*.egg-info\|__pycache__'

" CtrlP Py Matches
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag -g "" -l -i --nocolor %s'
else
    echo 'Could not find ag, using default ctrlp filename list generator'
endif

let g:ag_prg="ag --column --nogroup --noheading --smart-case"


let g:grepper = { 'tools' : ['ag', 'git', 'grep' ], 'open': 1, 'jump': 0, 'switch': 0, 'next_tool': '<leader>g' }

" Ale configuration
let g:ale_linters = {
\ 'python': ['flake8']
\ }

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:python_highlight_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Overwrite Plug-in 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif

    let letter = nr2char(getchar())

    if needs_disabling
        QuickScopeToggle
    endif

    return a:movement . letter
endfunction

let g:qs_enable = 0

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filename related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>cs :let @*=expand("%:p")<CR>

let g:deoplete#sources#jedi#python_path = '/usr2/mbakiev/nr/super/nr-pcs/.tox/py36/bin/python'
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

autocmd CompleteDone * silent! pclose!


" Has the file changed outside of NVIM?
au FocusGained * :checktime
