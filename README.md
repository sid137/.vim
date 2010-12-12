# VIM Configuration files


## Installation

download repository

    cd ~/
    git clone --recursive git://github.com/sid137/.vim.git

Create a symlink to .vimrc file
    
    ln -s ~/.vim/vimrc ~/.vimrc




## Features


Plugins loaded from .vim/bundle directory with Pathogen

### General Settings

* Text wrapped to 80 character lines
  
* 1000 line history and undo

* Tab stop at 4 spaces

* Tabs are converted to spaces

* Current line is highlighted

* Mouse enabled for all modes


### Key Mappings  (subject to change)

* Leader key mapped to 
  
    `,`


* Fast saving in Insert and Normal mode

    `,w`


* Easily edit the .vimrc from Insert mode

    `,e`


* Return to Normal mode from Insert mode

    `jk`    or  `,,`

* Reload the .vimrc file from Normal mode

    `,sv`

* Turn ; into : in Normal mode


* Clean highlighted searches from Normal mode

    `,/`


* Save file with sudo priviledges

    `w!!`


* Close current buffer

    `,bd`


* Close all buffers

    `,ba`


* Switch between buffers using left and right arrow keys

    
* Smart way to move btw. windows

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


### Autocommands

* .vimrc automatically reloaded when edited from VIM


" Enable extended % matching
runtime macros/matchit.vim

* Run script with F5 key when shebbang is present


autocmd FileType ruby :call DoRubyMappings()

function! DoRubyMappings()

    " bind control-l to hashrocket
    imap <buffer> <C-l> <Space>=><Space>"

    " convert word into ruby symbol
    imap <buffer> <C-k> <C-o>b:<Esc>Ea
    nmap <buffer> <C-k> lbi:<Esc>E"
   
    inoremap <buffer> [[ ?def <CR>
    inoremap <buffer> ]] /def <CR>

    nmap <buffer> [[ ?def <CR>
    nmap <buffer> ]] /def <CR>

    inoremap <buffer> ; :
    inoremap <buffer> ;; ;
    inoremap <buffer> 2 "
    inoremap <buffer> 22 2
    imap <buffer> 9 (
    inoremap <buffer> 99 9
    imap <buffer> 0 )
    inoremap <buffer> 00 0
    inoremap <buffer> \ |
    inoremap <buffer> \\ \
    inoremap <buffer> ;; ;

" NERTree Plugin
nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap ,N :NERDTreeClose<CR>

" load comments.vim for easy commenting
" http://www.vim.org/scripts/script.php?script_id=1528

noremap <leader>t :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>


" Use AutoCMD to automaticall create nonexistant directories on save
" http://www.ibm.com/developerworks/linux/library/l-vim-script-5/index.html



"""""""""""""""""""""""""""""""""""""""""""""
""Snipmate Mod
"""""""""""""""""""""""""""""""""""""""""""""
" Reload snippets and close snippet buffer on snippet save
autocmd BufWritePost *.snippet :call ReloadAllSnippets() | :Bclose

"shortcuts to quickly create new snippet
map <Leader>ca :call MakeSnippet()<CR>
imap <Leader>ca <ESC> :call MakeSnippet()<CR>

function! MakeSnippet()
	if exists("g:snippet_file_type")
		unlet g:snippet_file_type
	endif

	if empty(&ft)
		echo "No filetype defined for snippet"
	else
		let name = input('Enter the snippet abbreviation: ')
		let g:snippet_file_type = &ft
		let snippet_path = g:snippets_dir . g:snippet_file_type . '/' . name . '.snippet'
		exec "edit" snippet_path
		let &filetype=g:snippet_file_type
	endif
endfunction


