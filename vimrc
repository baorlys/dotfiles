" ==========================================
" 1. DANH SÁCH PLUGINS
" ==========================================
" Lưu plugin vào thư mục chuẩn của Neovim
call plug#begin(stdpath('data') . '/plugged')

    " Giao diện & Theme
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Quản lý file & Tìm kiếm
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Hỗ trợ Code
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'machakann/vim-highlightedyank'

call plug#end()

" ==========================================
" 2. CẤU HÌNH CƠ BẢN
" ==========================================
set number
set relativenumber
set mouse=a
set clipboard+=unnamedplus
set syntax=on
set encoding=UTF-8
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ignorecase
set smartcase
set hlsearch
set incsearch

" ==========================================
" 3. PHÍM TẮT (KEY MAPPINGS)
" ==========================================
let mapleader = " "
let g:loaded_node_provider = 0

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>
" FZF
nnoremap <leader>f :Files<CR>
" Clear highlight
nnoremap <leader>h :nohlsearch<CR>
" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ==========================================
" 4. KÍCH HOẠT THEME
" ==========================================
" Chỉ kích hoạt theme nếu plugin đã được tải
try
    colorscheme dracula
catch
    colorscheme default
endtry

" Highlight Yank (Neovim Built-in)
augroup HighlightYank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=150})
augroup END
