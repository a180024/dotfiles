" **GENERAL VIM CONFIG**
set nocompatible
"color scheme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme onedark 
set background=dark
set t_Co=256
highlight Normal ctermbg=None
highlight Linenr ctermfg=DarkGrey
let g:airline_theme='onedark'
" Turn on syntax highlighting.
syntax on
" let python_highlight_all = 1
" Disable the default Vim startup message.
set shortmess+=I
" Show line numbers.
set number
" auto-reload.
augroup myvimrchooks
       	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

autocmd BufWritePost .vimrc,_vimrc source $MYVIMRC
" line number
set relativenumber
" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
" backspace over anything.
set backspace=indent,eol,start
" hide a buffer
set hidden
" search case sensitive/insensitive when sentence has caps/nocaps
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
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set colorcolumn=80
set viminfo='25,\"50,n~/.viminfo
filetype plugin indent on
set smartindent
set autoindent
autocmd FileType html javascript setlocal ts=2 sts=2 sw=2
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
nnoremap ,1 :set tabstop=2<CR>
nnoremap ,2 :set shiftwidth=2<CR>
" CSS autocompletion
set omnifunc=syntaxcomplete#Complete
" folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
nnoremap ,m :mkview<CR>
nnoremap ,l :loadview<CR>
" window
set splitbelow
set termwinsize=10x0
" tabs
map ,t :tabnew 
map ,e :tabedit
" Insert line above with going into insert mode
nmap <leader>O O<ESC>
" auto set working dir
set autochdir
" curly braces automatically inset new line
" autocmd FileType c,javascript inoremap {<Cr> {<CR>}<ESC>O

" **VIM PLUG**
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'preservim/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'romkatv/powerlevel10k'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug '907th/vim-auto-save'
Plug 'liuchengxu/vim-which-key'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" **PLUG SETTINGS**
" fzf
set rtp+=/usr/local/opt/fzf
" powerline fonts
let g:airline_powerline_fonts = 1
" nerdtree tabs
map <Leader>F :NERDTreeFocus<CR>R<c-w><c-p>
map <Leader>N <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
" nerd commenter
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
" emmet
let g:user_emmet_leader_key=','
" vim auto save
" let g:auto_save = 1
" coc nvim
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB> 
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Formatting selected code.
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Which Key
let g:which_key_timeout = 100
let g:mapleader = "\\"
let g:maplocalleader = ','
call which_key#register('\', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '\'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '\'<CR>
" Define prefix dictionary
let g:which_key_map =  {}
let g:which_key_map['.'] = [ ':e $MYVIMRC' , 'vimrc' ]
let g:which_key_map['E'] = [ ':exit' , 'exit vim window' ]
let g:which_key_map['T'] = [ ':term', 'terminal' ]
let g:which_key_map.b = {
      \ 'name' : '+buffers' ,
      \ '[' : [':bp!'                               , 'Previous Buffer'],
      \ ']' : [':bn!'                               , 'Next Buffer'],
      \ 'x' : [':bd'                                , 'Delete Buffer'],
      \ }
let g:which_key_map.t = {
      \ 'name' : '+tabs' ,
      \ 'h' : [':tabfirst'                         , 'First Tab'],
      \ 'j' : [':tabnext'                          , 'Next Tab'],
      \ 'k' : [':tabprev'                          , 'Previous Tab'],
      \ 'l' : [':tablast'                          , 'Last Tab'],
      \ 'n' : [':tabnew'                           , 'New tab'],
      \ 'd' : [':tabclose'                         , 'Close Tab'],
      \ }
let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'E' : [':Fold'                               , 'fold'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : [':Format'                             , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : [':CocList outline'                    , 'search outline'],
      \ 'O' : [':OR'                                 , 'organise imports'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 's' : [':CocList -I symbols'                 , 'symbols'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 's' : [':!git status'                    , 'Git status'],
      \ 'd' : [':!git diff'                      , 'Git diff'],
      \ }
let g:which_key_map.p = {
      \ 'name' : '+pasting' ,
      \ 'p' : [':set paste'                          , 'Set Paste'],
      \ 'u' : [':set nopaste'                        , 'Undo Paste'],
      \ }
let g:which_key_map.w = {
      \ 'name' : '+window' ,
      \ 'r' : [':resize 10'                          , 'Resize Window 10x0'],
      \ }
