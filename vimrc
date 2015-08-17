execute pathogen#infect()

" Color schemes {{{
syntax on              " enable syntax processing
colorscheme Monokai    " awesome colorscheme
set background=dark
let g:rehash256 = 1
let g:molokai_original = 1
" }}}

" Spaces/tabs {{{
set tabstop=2
set softtabstop=2
set expandtab

" Easy align
vnoremap <silent> <Enter> :EasyAlign<cr>
" }}}

" UI Config {{{
filetype on
set number
set showcmd
"set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
" view 80th column
"if (exists('+colorcolumn'))
"        set colorcolumn=80
"        highlight ColorColumn ctermbg=9
"end
" }}}

" Search {{{
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent
" }}}

" Movement {{{
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
nnoremap gV `[v`]
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
map <C-B> :bn!<cr>
map <C-S-B> :bp!<cr>
let g:miniBufExplMapCTabSwitchBufs=1
" }}}

" Leader shortcuts {{{
let mapleader=","
inoremap jj <esc>
nnoremap u :GundoToggle<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>s :mksession<CR>
" }}}

" Autogroups {{{
augroup configgroup
        autocmd!
        autocmd VimEnter * highlight clear SignColumn
        autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.css,*.erb :call <SID>StripTrailingWhitespaces()
        autocmd FileType java setlocal noexpandtab
        autocmd FileType java setlocal list
        autocmd FileType java setlocal listchars=tab:+\ ,eol:-
        autocmd FileType java setlocal formatprg=par\ -w80\ -T4
        autocmd FileType php setlocal expandtab
        autocmd FileType php setlocal list
        autocmd FileType php setlocal listchars=tab:+\ ,eol:-
        autocmd FileType php setlocal formatprg=par\ -w80\ -T4
        autocmd FileType ruby setlocal tabstop=2
        autocmd FileType ruby setlocal shiftwidth=2
        autocmd FileType ruby setlocal softtabstop=2
        autocmd FileType ruby setlocal commentstring=#\ %s
        autocmd FileType python setlocal commentstring=#\ %s
        autocmd BufEnter *.cls setlocal filetype=java
        autocmd BufEnter *.zsh-theme setlocal filetype=zsh
        autocmd BufEnter Makefile setlocal noexpandtab
        autocmd BufEnter *.sh setlocal tabstop=2
        autocmd BufEnter *.sh setlocal shiftwidth=2
        autocmd BufEnter *.sh setlocal softtabstop=2
augroup END
" }}}

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" Custom Functions {{{
function! <SID>StripTrailingWhitespaces()
        let _s=@/
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        let @/=_s
        call cursor(l, c)
endfunction
" }}}

" Build commands {{{
:map <F7> :make <CR>
:autocmd FileType php noremap <C-M> :w!<CR>:!/usr/bin/php %<CR>
:autocmd FileType ruby noremap <C-M> :w!<CR>:!/home/jkcorrea/.rvm/rubies/ruby-2.1.1/bin/ruby %<CR>
"}}}

set modeline
set modelines=1
" vim:foldmethod=marker:foldlevel=0
