syntax on

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

compiler ruby

set incsearch
set hlsearch
set number
set showmatch
set hidden
set backspace=indent,eol,start
set textwidth=0 nosmartindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set ruler
set wrap
set scrolloff=5
set nofoldenable
set nocompatible
set laststatus=2
set ignorecase
set smartcase
set cursorline
set colorcolumn=80
set wildignore+=target

set nobackup
set nowritebackup
set noswapfile

set winwidth=90
set winminwidth=15

set list
set listchars=tab:\ \ ,trail:·


hi Search    ctermbg=none ctermfg=none cterm=underline
hi IncSearch ctermbg=none ctermfg=none cterm=bold,underline

" plugin options
let NERDTreeMinimalUI           = 1
let NERDTreeQuitOnOpen          = 0
let NERDChristmasTree           = 1
let NERDTreeHighlightCursorline = 0
let NERDTreeWinSize             = 35
let NERDTreeDirArrows           = 1
let NERDTreeStatusline          = ' '
let NERDTreeShowHidden          = 1
let NERDTreeChDirMode           = 1
let NERDTreeShowLineNumbers     = 0
let NERDTreeMouseMode           = 2
let NERDTreeAutoCenter          = 1
let NERDTreeAutoCenterThreshold = 10
let NERDTreeIgnore              = ['\.git', '\.pyc', '\.jhw-cache']
let g:no_html_toolbar           = 'yes'
let g:CommandTMaxHeight         = 10
let g:CommandTMaxDepth          = 10
let g:airline_powerline_fonts   = 1
let coffee_no_trailing_space_error = 1

autocmd QuickFixCmdPost *grep* cwindow

" key bindings
imap <C-L> <SPACE>=><SPACE>
imap <C-K> ->

nmap , \

map <Leader>t :CommandT<CR>
map <silent> <LocalLeader>fb :CommandTBuffer<CR>
map <silent> <LocalLeader>fr :CommandTFlush<CR>

map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>nr :NERDTree<CR>
map <silent> <LocalLeader>nf :NERDTreeFind<CR>

nmap g/ :Ggrep<space>
nmap g* :Ggrep <C-R><C-W>
nmap gn :cnext<CR>
nmap gp :cprev<CR>
nmap gq :ccl<CR>
nmap gl :cwindow<CR>>

map Y y$

" functions
function! Trim()
  exe "normal mz"
  %s/\s*$//
  exe "normal `z"
  exe "normal zz"
endfunction

let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme Tomorrow-Night-Eighties

function! SetBorder()
  exe 'hi CursorLine ctermbg=NONE'
  exe 'hi rubyDefine ctermbg=NONE'
endfunction

function! MakeLight()
  exe ':set background=light'
endfunction

function! MakeDark()
  exe ':set background=dark'
endfunction

function! ClearBackground()
  exe 'hi Normal ctermbg=NONE'
endfunction

function! SolarizedLight()
  let g:solarized_termcolors=256
  let g:solarized_visibility = "high"
  colorscheme solarized
  call MakeLight()
endfunction

function! SolarizedDark()
  let g:solarized_termcolors=16
  let g:solarized_visibility = "high"
  let g:solarized_contrast = "high"
  colorscheme solarized
  call MakeDark()
endfunction

function! TomorrowNight()
  colorscheme Tomorrow-Night
  call MakeDark()
  call ClearBackground()
endfunction

"call MakeLight()
call TomorrowNight()
call SetBorder()

command! -nargs=0 Trim :call Trim()
command! -nargs=0 MakeLight :call MakeLight()
command! -nargs=0 MakeDark :call MakeDark()
command! -nargs=0 TomorrowNight :call TomorrowNight()
command! -nargs=0 SolarizedLight :call SolarizedLight()
command! -nargs=0 SolarizedDark :call SolarizedDark()
command! -nargs=0 ClearBackground :call ClearBackground()
nnoremap <silent> <Leader>cw :Trim<CR>

" solarized + coffee == annoying parens, fix that
autocmd BufReadPost *.coffee hi coffeeParen ctermfg=none

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup