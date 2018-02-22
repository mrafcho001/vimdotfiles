" VIM-Airline (status line plugin)
let g:airline_symbols = {}
let g:airline_detect_modified = 1
let g:airline_detect_pase = 1
let g:airline#extensions#whitespace#enabled = 0

if !exists('g:airline_symbol')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
