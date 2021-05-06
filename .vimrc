set history=500
set number
set autoread

    
au BufRead,BufNewFile  *.tla set filetype=tla
" au BufRead,BufNewFile  *.cfg set filetype=cfg


if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
 
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
 "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
 " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
 set termguicolors
 endif

"" TODO	 change VertSplit, set visual_black color  
let g:palenight_color_overrides = {
	\    'visual_black': { 'gui': '#999999', "cterm": "0", "cterm16": "0" },
	\    'black': { 'gui': '#1c1c1c', "cterm": "0", "cterm16": "0" },
	\    'cursor_grey': { 'gui': '#1c1c1c', "cterm": "0", "cterm16": "0" },
	 \ }


packadd! matchit

noremap  <silent> <C-S>      :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" https://vim.fandom.com/wiki/Switching_between_files
nnoremap <f1> :bn<CR>
nnoremap <f2> :bp<cr>
	
" Pmenu – normal item
" PmenuSel – selected item
" PmenuSbar – scrollbar
" PmenuThumb – thumb of the scrollbar
" highlight Pmenu  ctermbg=grey  

set guioptions-=m 
set guioptions-=T 
set guioptions-=r 
set guioptions-=L 

set guifont=Monospace\ 14 

  
" Enable CursorLine
set cursorline

" Default Colors for CursorLine  // bold, italic, underline, reverse, none
hi CursorLine term=bold cterm=bold 

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight    CursorLine guibg=grey30	  guifg=NONE
" autocmd InsertEnter * highlight    CursorLine ctermbg=black  ctermfg=None
" autocmd InsertEnter * highlight  CursorLine guibg=8    guifg=NONE

" Revert Color to default when leaving Insert Mode
" autocmd InsertLeave * highlight  CursorLine guibg=NONE   guifg=NONE
autocmd InsertLeave * highlight  CursorLine guibg=#242424   guifg=NONE


nnoremap <f8> :NERDTreeToggle<CR>
"nnoremap <f8>  :NERDTree<CR>
"nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

let g:polyglot_disabled = ["python"]
let g:polyglot_disabled = ["autoindent"]



call vundle#begin() 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ivanov/vim-ipython'
" Plugin 'davidhalter/jedi-vim' "conflict with python-mode
call vundle#end()            

filetype plugin indent on    " required

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree' 
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }			
Plug 'SirVer/ultisnips'
Plug 'prabirshrestha/asyncomplete.vim'

Plug 'psf/black', {'branch': 'stable'} 
Plug 'sheerun/vim-polyglot'

Plug 'mattn/emmet-vim'

Plug 'drewtempelmeyer/palenight.vim'

call plug#end()


set background=dark
colorscheme palenight   
" Italics for my favorite color scheme
" let g:palenight_terminal_italics=1
" let g:lightline = { 'colorscheme': 'palenight' }
" let g:airline_theme = "palenight"


" let g:coc_node_path = '/home/erretres/.nvm/versions/node/v10.23.0/bin/node'
let g:ale_linters = {'cs': ['OmniSharp'], 'python': ['flake8'] }
let g:ale_fixers  = {'python': ['yapf'] }
let g:ale_fix_on_save = 1
let g:ale_linters_on_text_changed = 'never'
let g:ale_linter_on_enter = 0

let g:user_emmet_install_global = 0
" autocmd FileType html,css 

let g:OmniSharp_selector_ui = 'fzf'    " Use fzf
let g:asyncomplete_auto_popup = 0
let g:asyncomplete_auto_completeopt = 1

imap     <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr>    <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr>    <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr>    <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" coc.nvim 
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

if has("patch-8.1.1564")
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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

