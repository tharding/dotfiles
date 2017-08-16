"
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
"
" Original Author:	     Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Modified by :          Ben McCormick
" Last change:	         2014 June 8
"
" To use it, copy it to
"  for Unix based systems (including OSX and Linux):  ~/.vimrc
"  for Windows :  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/project.tar.gz'
Plugin 'vim-scripts/srec.vim--Saco'
Plugin 'vim-scripts/taglist.vim'
Plugin 'eiginn/netrw'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'weynhamz/vim-plugin-minibufexpl'
Plugin 'junegunn/vim-easy-align'
Plugin 'Shougo/unite.vim'
Plugin 'SirVer/ultisnips' "Snippets engine
Plugin 'honza/vim-snippets' "ultisnips snippets

" Color Schemes
Bundle 'jnurmine/Zenburn'
Bundle 'altercation/vim-colors-solarized'

call vundle#end()

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
set background=dark
let python_highlight_all=1
syntax on
colorscheme solarized

" cache directory
let s:cache_dir = '~/.vim/.cache'

let g:SimpylFold_docstring_preview=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set textwidth=72 " set the line wrap for all files to 72 as the default
if has ("autocmd") " From example vimrc
  filetype plugin indent on " load filetype, and indent plugins
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 " For airline set laststatus to 2 so it is always on
let g:airline_powerline_fonts=1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1

set number " Show line numbers
set hidden " Allow hidden buffers, don't limit to 1 file per window/split
set history=100 " Number of commands to store in the history
if has("spell") "Turn on spelling (This needs a little more work so it doesn't check source code files)
  set spelllang=en_us
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnipssetting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<s-tab>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Programming setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cf " enable error files and error jumping
set makeef=error.err " When using make, where should it dump the file
set errorformat=%f:%l:\ %t%*[^\ ]\ %n:%m,%f:%l:%c:\ %m,%f:%l:\ %t%*[^\ ]\ %n:%m
set errorformat+=%f:%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m "GCC errors
set errorformat+=\*\*\ %tRROR:\ %f(%l):\ %m,\*\*\ %tRROR:\ %m,\*\*\ %tARNING:\ %m,\*\*\ %tOTE:\ %m,%tRROR:\ %f(%l):\ %m,%tARNING\[%*[0-9]\]:\ %f(%l):\ %m,%tRROR:\ %m,%tARNING\[%*[0-9]\]:\ %m

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " show matching brackets
set nohlsearch " do not highlight searched for phrases
set incsearch " BUT do highlight as you type you search phrase
set noerrorbells " no noises
set vb t_vb= " Disable beeping and visual bells

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fo=tcrqn " See Help (complex)
set ai " autoindent
set si " smartindent 
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify 
set expandtab " real spaces please!
set nowrap " do not wrap lines  
set smarttab " use tabs at the start of a line, spaces elsewhere
" Enable folding
set foldmethod=indent
set foldlevel=99

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" You Complete Me Seetings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Project
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:proj_flags = "imstLv"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable folding with the spacebar
nnoremap <space> za
noremap <C-l>   :MBEbn<CR>
noremap <C-h>   :MBEbp<CR>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")

  autocmd BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
  autocmd BufNewFile,BufRead *.vimprojects setlocal nospell
  autocmd BufNewFile,BufRead *.vhd :set tw=0 " Don't do line wrapping on VHDL files
  autocmd BufNewFile,BufRead *.py :set tw=100 " Wrap python files at 100 chars.
  autocmd BufNewFile,BufRead *.srec set filetype=srec
  autocmd FileType gitcommit setlocal spell

  " autocmds to automatically enter hex mode and handle file writes properly
  " vim -b : edit binary using xxd-format!
  augroup Binary
    au!
	" Use the below highlight group when displaying bad whitespace is desired.
	highlight BadWhitespace ctermbg=red guibg=red

	" Display tabs at the beginning of a line in Python mode as bad.
	au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
	" Make trailing whitespace be flagged as bad.
	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

	au BufNewFile,BufRead *.py set fileformat=unix
    au BufReadPre *.bin setlocal binary nospell
    au BufReadPost *
          \ if &binary | Hexmode | endif
    au BufWritePre *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  exe ":silent %!xxd -r" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
    au BufWritePost *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  exe ":silent %!xxd" |
          \  exe "set nomod" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
  augroup END
endif

function! s:get_cache_dir(suffix) "{{{
    return resolve(expand(s:cache_dir . '/' . a:suffix))
endfunction "}}}

function! EnsureExists(path) "{{{
	if !isdirectory(expand(a:path))
		call mkdir(expand(a:path))
	endif
endfunction "}}}

" vim file/folder management {{{
	" persistent undo
	if exists('+undofile')
		set undofile
		let &undodir = s:get_cache_dir('undo')
	endif

	" backups
	set backup
	let &backupdir = s:get_cache_dir('backup')

	" swap files
	let &directory = s:get_cache_dir('swap')
	set noswapfile

	call EnsureExists(s:cache_dir)
	call EnsureExists(&undodir)
	call EnsureExists(&backupdir)
	call EnsureExists(&directory)
"}}}
