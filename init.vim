set mouse=a
set tabstop=4 
set shiftwidth=4
set listchars=tab:\¦\ 	" Tab charactor 
set list
set foldmethod=indent  
set foldlevelstart=99   
set number 
set ignorecase 
set termguicolors
"¦
" Disable backup
set nobackup
set nowb
set noswapfile
set nocompatible

" Enable copying from vim to clipboardt
if has('win32')
	set clipboard=unnamed  
else
	set clipboard=unnamedplus
endif

au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
		\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
			\ | checktime 
		\ | endif
autocmd FileChangedShellPost *
		\ echohl WarningMsg 
		\ | echo "File changed on disk. Buffer reloaded."
		\ | echohl None

" Resize pane
nmap <M-Right> :vertical resize +1<CR> 		
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/AppData/Local/nvim/plugged')

" Theme
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'pacokwon/onedarkhc.vim'
	Plug 'joshdick/onedark.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'octol/vim-cpp-enhanced-highlight'

" Rainbw, syntax
	Plug 'luochen1990/rainbow'
	Plug 'Valloric/vim-operator-highlight'

" File browser
	Plug 'preservim/nerdTree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'unkiwii/vim-nerdtree-sync' 

" File search
	Plug 'junegunn/fzf', 
		\ { 'do': { -> fzf#install() } } 
	Plug 'junegunn/fzf.vim'

" Status bar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

" Code intellisense
	Plug 'neoclide/coc.nvim', {'branch': 'release'} 
	Plug 'jiangmiao/auto-pairs' 
	Plug 'alvan/vim-closetag'
	Plug 'mattn/emmet-vim' 
	Plug 'preservim/nerdcommenter' 
	Plug 'liuchengxu/vista.vim'  
	Plug 'alvan/vim-closetag'

" Code syntax highlight
	Plug 'yuezk/vim-js'
	Plug 'MaxMEllon/vim-jsx-pretty'
	Plug 'uiiaoo/java-syntax.vim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'jackguo380/vim-lsp-cxx-highlight'	

" Debugging
"	Plug 'puremourning/vimspector'

" Source code version control 
	Plug 'tpope/vim-fugitive'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Key Maps

"Esc
nnoremap fj <Esc>
inoremap fj <Esc>
vnoremap fj <Esc>

"Move
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"Change buffers 
nnoremap <C-j> :bprevious<CR>
nnoremap <C-k> :bnext<CR>
nnoremap <C-Up> :bfirst<CR>
nnoremap <C-Down> :blast<CR>
nnoremap <C-w> :bd<CR>

"Save file
nnoremap <C-s> :w<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Themes + syntax
syntax on
set background=dark
set t_Co=256
colorscheme onedark 

hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Rainbow Config
let g:rainbow_active = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
	execute 'source' setting_file
endfor

