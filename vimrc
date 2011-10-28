" Many settings taken from 
" http://nvie.com/posts/how-i-boosted-my-vim/ 
"
" Most general settings first
set nocompatible            " Set Vim rather than Vi settings; must go first
set noeb                    " Set no audio or visual error beep
set bs=2
set bs=indent,eol,start     " Allow backspacing over everything in insert mode
set history=1000             " Keep 1000 lines of command line history
set undolevels=1000

""Text basics
set textwidth=80            " Set text to wrap at 80 columns
set expandtab               " Convert tabs to spaces
set tabstop=2               " Tabs = 2 spaces 
set shiftwidth=2            " Indent/outdent 2 spaces
set softtabstop=2           " Tab key indents 
set shiftround              " Indent/outdent to nearest tabstop
set smarttab                " Uses shiftwidth @ start of lines
set fo=trcn
set hidden
set autoindent
set smartindent
set hlsearch
set incsearch
set t_Co=256                " Make terminal more colorful
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files"
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set laststatus=2  " Always show status line.

"highlight clear SpellBad
"highlight SpellBad term=reverse ctermbg=1 gui=undercurl guisp=Blue

" set background=dark
set title
set cursorline
set scrolloff=999

" Set items for view @ bottom of windows
set ruler                   " Show the cursor position all the time
set showcmd                 " Display incomplete commands
set showmode                " Display current mode
set ls=2                    " Always show status bar
 
" Enable mouse in all modes
set mouse=a

"Enable spellcheck"
" Very anti-useful in programming modes
""set spell

" togle paste mode
set pastetoggle=<F2>

colorscheme delek
syntax on

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype off          " Force reloading on Debian
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugin


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Maps
" Map leader to ","
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let mapleader = ","
let g:mapleader = ","

" Fast saving
imap <leader>w <Esc>:w!<cr> 
nmap <leader>w :w!<cr>
"
" " Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" Map jk to <ESC> in insert mode
imap <Leader><Leader> <ESC>
imap jk <ESC>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Use jw to go to the end of a line in Insert mode"
imap jw  <END>

"  turn ; into :
nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
""vmap Q gq
""nmap Q gqap

" User C to reexecute the lasts executed macro"
map Q @@

nnoremap j gj
nnoremap k gk

" Tired of clearing highlighted searches by searching for “ldsfhjkhgakjks”? Use this:
" It clears the search buffer when you press ,/
nmap <silent> ,/ :let @/=""<CR>

" post sudo with !!
cmap w!! w !sudo tee % >/dev/null

inoremap <silent> <C-a> <ESC>u:set paste<CR> :set nopaste<CR>gi 	

map <M-F10> :!ruby -r xmp -n -e 'xmp($_, "\%l\t\t\# \%r\n")'<CR>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>


" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Easier non-interactive command insertion
" "nnoremap <Space> :


" Increase Max file limit for Command-T"
let g:CommandTMaxFiles=30000




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc
let g:haddock_browser = "firefox"



" " When vimrc is edited, reload it
autocmd! BufWritePost .vimrc source $MYVIMRC 


" Enable extended % matching
runtime macros/matchit.vim


" execute script with F5 is shebbang is prersent
function! RunShebang()
  if (match(getline(1), '^\#!') == 0)
    :!clear; ./%
  else
    echo "No shebang in this file."
  endif
endfunction
map <F5> :call RunShebang()<CR>

" Python Auto Filetype"
autocmd FileType python set autoindent smartindent et sts=4
\ cinwords=class,def,elif,else,except,finally,for,if,try,while
autocmd FileType python inoremap # X#

augroup filetypedetect
    au BufRead,BufNewFile *.ru setfiletype ruby
    au BufRead,BufNewFile Gemfile setfiletype ruby
    au BufRead,BufNewFile Termfile setfiletype ruby
    au BufRead,BufNewFile Guardfile setfiletype ruby
    au BufRead,BufNewFile Rakefile  setfiletype ruby
augroup END


" ===============================
" One Liner Configurations
" ===============================

" Gist 
" http://www.vim.org/scripts/script.php?script_id=2423
let g:gist_detect_filetype = 1  " Let gist detect filetype from filename
let g:gist_open_browser_after_post = 1   " Open browser after post
let g:gist_browser_command = 'firefox %URL%' "Browser command..  just in case
let g:gist_clip_command = 'xclip -selection clipboard'  " Use option -c to have gist gopy the gist code

"  Coffeescript configuration"
"  https://github.com/kchmck/vim-coffee-script "

let coffee_compile_on_save = 1
"autocmd BufWritePost,FileWritePost *.coffee silent !docco <afile> > /dev/null &

map <Leader>d :!rocco % >  /dev/null &<CR>
imap <Leader>d <ESC>:!rocco % > /dev/null &<CR>
" not working with filetype detection
""autocmd FileType coffee :call DoCoffeeScriptMappings()
""autocmd FileType coffee vmap <buffer> oc :CoffeeCompile<CR>  
""function! DoCoffeeScriptMappings()
    ""vmap <buffer> oc :CoffeeCompile<CR>  
""endfunction

" ================
" Ruby stuff
" ================
" "https://github.com/r00k/dotfiles/blob/master/vimrc
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,haml,js,coffee set ai sw=2 sts=2 et
augroup END
" ================
au BufRead,BufNewFile *.thor set filetype=ruby

autocmd User Rails :call DoConfigureRails()
function! DoConfigureRails()
    map <Leader>m :Rmodel<CR>
    imap <Leader>m <ESC>:Rmodel<CR>
    map <Leader>c :Rcontroller<CR>
    imap <Leader>c <ESC>:Rcontroller<CR>
    map <Leader>rv :Rview<CR>
    imap <Leader>rv <ESC>:Rview<CR>
    
    map <Leader>f :e spec/factories.rb<CR>
    imap <Leader>f <ESC>:e spec/factories.rb<CR>
    map <Leader>sc :e db/schema.rb<cr>
    " "let Rails compile the coffescript, starting from 3.1
    let coffee_compile_on_save = 0
    map <Leader>sm :RSmodel
    map <Leader>su :RSunittest
    map <Leader>sv :RSview
    map <Leader>u :Runittest
    map <Leader>vc :RVcontroller
    map <Leader>vf :RVfunctional
    map <Leader>vu :RVunittest<CR>
    map <Leader>vm :RVmodel
    map <Leader>vv :RVview 

   " Rails specific autocommands"
   " Race condition? I have  6 zillion proceses running when I do this
    ""autocmd BufWritePost,FileWritePost *.sass silent !compass compile -q <afile> > /dev/null &

endfunction

"shortcuts to quickly create new snippet
vmap <Leader>rp :call ExtractPartial()

function! ExtractPartial()
    let partial_name = input('Enter the partial name: ')
    exec "Rextract" partial_name
endfunction

autocmd FileType ruby :call DoRubyMappings()
function! DoRubyMappings()

    " bind control-l to hashrocket
    imap <buffer> ji <Space>=><Space>

    " convert word into ruby symbol
    imap <buffer> <C-k> <C-o>b:<Esc>Ea
    nmap <buffer> <C-k> lbi:<Esc>E"
   
    inoremap <buffer> [[ ?def <CR>
    inoremap <buffer> ]] /def <CR>

    nmap <buffer> [[ ?def <CR>
    nmap <buffer> ]] /def <CR>

    inoremap <buffer> ; :
    inoremap <buffer> ;; ;

    " Ruby mapppings from Ben Orenstein
     vmap <Leader>b :<C-U>!git blame <C-R>=expand(%:p) <CR> \| sed -n <C-R>=line('<) <CR>,<C-R>=line('>) <CR>p <CR>
""    map <Leader>cc :!cucumber %<CR>
""    map <Leader>co :TComment<CR>
""    map <Leader>d odebugger<cr>puts 'debugger'<esc>:w<cr>
    map <Leader>gac :Gcommit -m -a <LEFT>
    map <Leader>gc :Gcommit -m <LEFT>
    map <Leader>gs :Gstatus<CR>
""    map <Leader>fa :sp test/factories.rb<CR>
""    map <Leader>fix :cnoremap % %<CR>
""    map <Leader>i mmgg=G`m<CR>
    map <Leader>l :!ruby <C-r>% \| less<CR>
    "map <Leader>s :!ruby -Itest -Ispec %<CR>
    map <Leader>s :!clear; rspec spec<CR>
    imap <Leader>s <ESC>:!clear; rspec spec<CR>
    map <Leader>rd :!bundle exec rspec % --format documentation<CR>
    imap <Leader>a ,w,s
    map <Leader>a ,w,s
    map <Leader>o ?def <CR>:nohl<CR>wzy$:!ruby -Itest <C-r>% -n <C-r>z<CR>
    map <Leader>p :set paste<CR>i
    map <Leader>rw :%s/\s\+$//

endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "Nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERTree Plugin
""nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
""nmap ,m :NERDTreeClose<CR>:NERDTreeFind<CR>
""nmap ,N :NERDTreeClose<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]

let NERDTreeShowBookmarks=1       " Show the bookmarks table on startup
let NERDTreeShowFiles=1           " Show hidden files, too
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1          " Quit on opening files from the tree
let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree
let NERDTreeMouseMode=2           " Use a single click to fold/unfold directories
                                  " and a double click to open files
" load comments.vim for easy commenting
" http://www.vim.org/scripts/script.php?script_id=1528






let &printexpr="(v:cmdarg=='' ? ".
    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"




" FoldSearch-based folding.
" Copyright (C) 2005 Mauricio Fernandez <mfp@acm.org>
" Current version: http://eigenclass.org/hiki.rb?Usable+Ruby+folding+for+Vim
"
" Add this to your .vimrc and fold with :R. The default fold expression will
" work with Ruby scripts; you can specify where folds start with
" let b:foldsearchexpr = 'myexpression'
" e.g.
"  let b:foldsearchexpr='\(^\s*\(\(private\|public\|protected\|class\)\s\)\)'
" or so for Java.
" One way to have this buffer-local variable set is
" au Filetype java let b:foldsearchexpr='\(^\s*\(\(private\|public\|protected\|class\)\s\)\)'
"
" It is possible to have comments above a method/class/etc be included in the
" fold, by setting b:foldsearchprefix. All the lines above the detected fold
" matching b:foldsearchprefix will be included in said fold.
" For instance, for Ruby code:
"   let b:foldsearchprefix = '\v^\s*(#.*)?$'
" which can be automated with
"   au Filetype ruby let b:foldsearchprefix='\v^\s*(#.*)?$'
"
" Changelog:
" 2005-12-12  1.1  use b:foldsearchprefix to prepend comments to a fold.

"{{{ set s:sid

map <SID>xx <SID>xx
let s:sid = maparg("<SID>xx")
unmap <SID>xx
let s:sid = substitute(s:sid, 'xx', '', '')

"{{{ FoldText
function! s:Num2S(num, len)
    let filler = "                                                            "
    let text = '' . a:num
    return strpart(filler, 1, a:len - strlen(text)) . text
endfunction

execute 'set foldtext=' .  s:sid . 'MyNewFoldText()'
function! <SID>MyNewFoldText()
  let linenum = v:foldstart
  while linenum <= v:foldend
      let line = getline(linenum)
      if !exists("b:foldsearchprefix") || match(line, b:foldsearchprefix) == -1
    break
      else
    let linenum = linenum + 1
      endif
  endwhile
  if exists("b:foldsearchprefix") && match(line, b:foldsearchprefix) != -1
      " all lines matched the prefix regexp
      let line = getline(v:foldstart)
  endif
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  let diff = v:foldend - v:foldstart + 1
  return  '+ [' . s:Num2S(diff,4) . ']' . sub
endfunction

"{{{~foldsearch adapted from t77: Fold on search result (Fs <pattern>)
"Fs pattern Fold search
"Vimtip put to good use by Ralph Amissah zxy@irc.freenode.net
"Modified by Mauricio Fernandez <mfp@acm.org>
function! Foldsearch(search)
  setlocal fdm=manual
  let origlineno = line(".")
  normal zE
  normal G$
  let folded = 0     "flag to set when a fold is found
  let flags = "w"    "allow wrapping in the search
  let line1 =  0     "set marker for beginning of fold
  if a:search == ""
      if exists("b:foldsearchexpr")
    let searchre = b:foldsearchexpr
      else
    "Default value, suitable for Ruby scripts
    "\(^\s*\(\(def\|class\|module\)\s\)\)\|^\s*[#%"0-9]\{0,4\}\s*{\({{\|!!\)
    let searchre = '\v(^\s*(def|class|module|attr_reader|attr_accessor|alias_method)\s' . 
                 \ '|^\s*\w+attr_(reader|accessor)\s|^\s*[#%"0-9]{0,4}\s*\{(\{\{|!!))' .
                 \ '|^\s*[A-Z]\w+\s*\='
    let b:foldsearchexpr = searchre
      endif
  else
      let searchre = a:search
  endif
  while search(searchre, flags) > 0
    let  line2 = line(".")
    while line2 - 1 >= line1 && line2 - 1 > 0 "sanity check
       let prevline = getline(line2 - 1)
       if exists("b:foldsearchprefix") && (match(prevline, b:foldsearchprefix) != -1)
           let line2 = line2 - 1
       else
           break
       endif
    endwhile
    if (line2 -1 >= line1)
      execute ":" . line1 . "," . (line2-1) . "fold"
      let folded = 1       "at least one fold has been found
    endif
    let line1 = line2     "update marker
    let flags = "W"       "turn off wrapping
  endwhile
  normal $G
  let  line2 = line(".")
  if (line2  >= line1 && folded == 1)
    execute ":". line1 . "," . line2 . "fold"
  endif
  execute "normal " . origlineno . "G"
endfunction

"{{{~folds Fold Patterns
" Command is executed as ':Fs pattern'"
command! -nargs=? -complete=command Fs call Foldsearch(<q-args>)
command! -nargs=? -complete=command Fold call Foldsearch(<q-args>)
"command! R Fs \(^\s*\(\(def\|class\|module\)\s\)\)\|^\s*[#%"0-9]\{0,4\}\s*{\({{\|!!\)
command! D Fs 




command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry


""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc
noremap <leader>t :CommandT<cr>
noremap <leader>y :CommandTFlush<cr>


""""""""""""""""""""""""""""""
" Use AutoCMD to automaticall create nonexistant directories on save
" http://www.ibm.com/developerworks/linux/library/l-vim-script-5/index.html
""""""""""""""""""""""""""""""
augroup AutoMkdir
    autocmd!
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END
function! EnsureDirExists ()
    let required_dir = expand("%:h")
    if !isdirectory(required_dir)
        call AskQuit("Directory '" . required_dir . "' doesn't exist.", "&Create it?")

        try
            call mkdir( required_dir, 'p' )
        catch
            call AskQuit("Can't create '" . required_dir . "'", "&Continue anyway?")
        endtry
    endif
endfunction

function! AskQuit (msg, proposed_action)
	if confirm(a:msg, a:proposed_action . "\n&Quit?") == 2 
        exit
    endif
endfunction




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


