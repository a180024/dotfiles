" set nocompatible
filetype plugin indent on

"color scheme
colorscheme onedark
highlight Normal ctermbg=None
highlight Linenr ctermfg=DarkGrey

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" auto-reload.
augroup myvimrchooks
       	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

" python
let python_highlight_all = 1

" line number
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" backspace over anything.
set backspace=indent,eol,start

" hide a buffer
set hidden

" search case insensitive when sentence has no caps; sensitive when sentence
" has caps
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=80
set expandtab
set viminfo='25,\"50,n~/.viminfo

" open terminal
nmap <Leader>t :term<CR>

" indent/unindent with tab/shift-tab
nmap <Tab> >>
imap <S-Tab> <Esc><<i
nmap <S-tab> <<

" Avoid using arrow keys
" nnoremap <Left>  :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up>    :echoe "Use k"<CR>
" nnoremap <Down>  :echoe "Use j"<CR>
"" ...and in insert mode
" inoremap <Left>  <ESC>:echoe "Use h"<CR>
" inoremap <Right> <ESC>:echoe "Use l"<CR>
" inoremap <Up>    <ESC>:echoe "Use k"<CR>
" inoremap <Down>  <ESC>:echoe "Use j"<CR>

" vim tabs
map <C-y><Up> :tabr<CR>
map <C-y><Down> :tabl<CR>
map <C-y><Left> :tabp<CR>
map <C-y><right> :tabn<CR>

" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>

" Insert a line above with going into insert mode
nnoremap <leader>O O<ESC>

" vim plug

call plug#begin()
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdcommenter'
Plug 'lepture/vim-jinja'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'
Plug 'romkatv/powerlevel10k'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" fzf
set rtp+=/usr/local/opt/fzf

" powerline fonts
let g:airline_powerline_fonts = 1

" nerd tree tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1

" tagbar
nmap <Leader>b :TagbarToggle<CR> 
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
map <leader>s :SyntasticCheck<CR>
map <leader>d :SyntasticReset<CR>
