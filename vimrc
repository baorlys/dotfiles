" ==========================================
" 1. AUTO INSTALL VIM-PLUG (Tự động cài trình quản lý plugin)
" ==========================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==========================================
" 2. DANH SÁCH PLUGINS
" ==========================================
call plug#begin('~/.vim/plugged')

    " Giao diện & Theme
    Plug 'dracula/vim', { 'as': 'dracula' }  " Theme Dracula xịn xò
    Plug 'vim-airline/vim-airline'           " Thanh trạng thái đẹp phía dưới
    Plug 'vim-airline/vim-airline-themes'

    " Quản lý file & Tìm kiếm
    Plug 'preservim/nerdtree'                " Cây thư mục bên trái (File Explorer)
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Tìm kiếm file siêu nhanh
    Plug 'junegunn/fzf.vim'

    " Hỗ trợ Code (Coding Superpowers)
    Plug 'tpope/vim-commentary'              " Comment nhanh bằng 'gcc'
    Plug 'tpope/vim-surround'                " Thay đổi ngoặc/quotes nhanh (cực hay)
    Plug 'airblade/vim-gitgutter'            " Hiện dấu +/- khi sửa file git

call plug#end()

" ==========================================
" 3. CẤU HÌNH CƠ BẢN (BASIC SETTINGS)
" ==========================================
set number              " Hiện số dòng
set relativenumber      " Hiện số dòng tương đối (giúp nhảy dòng nhanh)
set mouse=a             " Cho phép dùng chuột
set clipboard=unnamedplus " Copy/Paste chung với Clipboard của Windows
set syntax=on           " Tô màu cú pháp
set encoding=UTF-8

" Tab & Indent (Chuẩn Java 4 spaces)
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Tìm kiếm thông minh
set ignorecase          " Tìm không phân biệt hoa thường
set smartcase           " Nếu gõ chữ hoa thì mới phân biệt
set hlsearch            " Highlight kết quả tìm kiếm
set incsearch           " Nhảy tới chữ ngay khi đang gõ

" ==========================================
" 4. PHÍM TẮT (KEY MAPPINGS)
" ==========================================
let mapleader = " "     " Đặt phím Leader là phím SPACE (Dễ bấm nhất)

" Phím tắt cho NERDTree (Cây thư mục)
" Bấm Space + e để bật/tắt cây thư mục
nnoremap <leader>e :NERDTreeToggle<CR>

" Phím tắt cho tìm kiếm file (FZF)
" Bấm Space + f để tìm file
nnoremap <leader>f :Files<CR>

" Tắt highlight tìm kiếm bằng Space + h
nnoremap <leader>h :nohlsearch<CR>

" Di chuyển giữa các cửa sổ màn hình dễ hơn (Ctrl + h/j/k/l)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ==========================================
" 5. KÍCH HOẠT THEME
" ==========================================
colorscheme dracula

" --- Highlight on Yank (Copy) ---
augroup HighlightYank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=150})
augroup END 
