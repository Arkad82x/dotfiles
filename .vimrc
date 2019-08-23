set termguicolors
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
filetype on
filetype plugin on
filetype indent on
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set omnifunc=syntaxcomplete#Complete
set nowrap
colorscheme apprentice
syntax enable
noremap <C-p> :Files<CR>
noremap <C-t> :Tags<CR>
set number
runtime macros/matchit.vim
"autocmd vimenter * NERDTree
noremap <C-o> :NERDTreeToggle %<CR>
noremap <C-f> :NERDTreeFind<CR>
noremap <C-i> :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup = 1

noremap <C-g>c :Gcommit<CR>
noremap <C-g>a :Gwrite<CR>
noremap <C-g>d :Gdiff<CR>
noremap <C-g>n :GitGutterNextHunk<CR>
noremap <C-g>p :GitGutterPrevHunk<CR>

set foldenable " enable folding
set foldlevelstart=1 " open most folds by default
set foldnestmax=2 " 10 nested fold max
set foldmethod=indent "fold based on indent leve
noremap <space> za

let g:ale_fix_on_save = 0


set nocompatible
"
" In '$ ~/' & '# ~/' run:
"
"     wget -N https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.vimrc -P ~/
"
" Or:
"
"     curl -o ~/.vimrc https://raw.githubusercontent.com/ryanpcmcquen/linuxTweaks/master/.vimrc
"

" Set 4 spaces globally & make indenting sane.
" ... Note that 'set paste' destroys indentation.
"
" We could also set `tabstop`, but let's
" keep tabs 'natural'.

" Allow the user to insert an actual tab with:
"     Ctrl + T
inoremap <C-T> <C-V><Tab>

" utf-8!
set encoding=utf-8 fileencoding=utf-8

" Clear out the cruft:
set nobackup nowritebackup noswapfile noundofile

" Make searching easy, and case insensitive:
set ignorecase smartcase incsearch hlsearch

" Gives you a little jazzy info on the bottom:
set title ruler

" Turn on the wildmenu, get wild!
set wildmenu

" Always show the mode, so you know what is up:
set showmode

" Unsets "last search pattern" register by hitting return.
nnoremap <CR> :noh<CR><CR>

" Nifty shortcut for middle of line instead of middle of screen:
map gm :call cursor(0, virtcol('$')/2)<CR>

if &term =~ '256color'
    " Render properly when in 256-color tmux:
    set t_ut=
endif

" Display filename in vim:
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

" Make vim use the system clipboard:
set clipboard^=unnamed,unnamedplus

" Delete to the blackhole register,
" keeps you from pasting deleted text:
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d

" Disable mouse usage.
" If I wanted to use the mouse, I wouldn't have learned vim!
set mouse=

" I just include my theme below,
" rather than having to download
" anything else.  ;^)
syntax on

" Pick up PICO-8 files:
augroup filetypedetect
    au BufRead,BufNewFile *.p8 setfiletype lua
augroup END


"
" End of my stuff.
"

"
" Start of `fix-vim-pasting`.
"

" https://github.com/ryanpcmcquen/fix-vim-pasting
"
" Because Vim doesn't like
" pasting that works.

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

"
" End of `fix-vim-pasting`.
"


