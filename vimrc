set nocompatible               " be iMproved



" Install the Vundle plugin manager if it doesn't already exist
if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  !git clone git://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

filetype off                   " must be off before Vundle has run

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" List of vim plugins to install
Plugin 'gmarik/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/c.vim'
Plugin 'sjbach/lusty'
Plugin 'tpope/vim-rvm'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'chrismetcalf/vim-yankring'
Plugin 'chrismetcalf/vim-taglist'
Plugin 'scrooloose/syntastic'
" Plugin "scrooloose/nerdtree"
Plugin 'sophacles/vim-bundle-sparkup'
Plugin 'panozzaj/vim-autocorrect'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/Gist.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'Bogdanp/rbrepl.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'xolox/vim-session' 
Plugin 'tomtom/tcomment_vim'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'gmarik/snipmate.vim'
Plugin 'krisleech/snipmate-snippets'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/powerline'
Plugin 'ervandew/supertab'
Plugin 'jQuery'
Plugin 'jnwhiteh/vim-golang'
Plugin 'derekwyatt/vim-scala'
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()



filetype plugin indent on     " and turn it back on!

" runtime macros/matchit.vim    
" End of Vundler config

" let g:indent_guides_start_level = 1
" let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

      


" Many settings taken from 
" http://nvie.com/posts/how-i-boosted-my-vim/ 
" https://github.com/krisleech/vimfiles
"
" Most general settings first
set nocompatible            " Set Vim rather than Vi settings; must go first
set noeb                    " Set no audio or visual error beep
set bs=2
set bs=indent,eol,start     " Allow backspacing over everything in insert mode
set history=10000             " Keep 1000 lines of command line history
set undolevels=10000


"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------
set textwidth=79            " Set text to wrap at 80 columns
set expandtab               " Convert tabs to spaces
set tabstop=2               " Tabs = 2 spaces 
set shiftwidth=2            " Indent/outdent 2 spaces
set softtabstop=2           " Tab key indents 
set shiftround              " Indent/outdent to nearest tabstop
set smarttab                " Uses shiftwidth @ start of lines


"  ---------------------------------------------------------------------------
"  Searching
"  ---------------------------------------------------------------------------
set hlsearch                " Enable highlighting search matches"
set incsearch               " Enable incremental searching"

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------
set autoindent
set smartindent

set fo=trcn
set hidden                  " Allow hiding of buffers instead of closing them"
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
set number

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
set pastetoggle=<F3>


colorscheme delek
syntax on


filetype off          " Force reloading on Debian
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugin


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Maps
" Map leader to ","
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ACK
set grepprg=ack

" ,a to Ack (search in files)
nnoremap <leader>ac :Ack 

" Ack settings: https://github.com/krisleech/vimfiles/wiki/Make-ack-ignore-files

" Auto format
map === mmgg=G`m^zz

" Easy commenting
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>


let g:snippets_dir="~/.vim/snippets/"

let mapleader = ","
let g:mapleader = ","

" Fast saving
imap <leader>w <Esc>:w!<cr>
nmap <leader>w :w!<cr> 
"
" " Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" Map jk to <ESC> in insert mode
" imap <Leader><Leader> <ESC>
imap jk <ESC>

" Show absolute line numbers in visual mode
" autocmd InsertEnter * :set number
" Show relative line numbers in normal mode
" autocmd InsertLeave * :set relativenumber

nmap <F4> :<C-U>silent make %:r<CR>:redraw!<CR>:!./%:r<CR>

" Function to handle normal mode line umber toggling"
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Toggle between absolute and relative line numbers in Normal mode using
" Ctrl-n"
nnoremap <C-n> :call NumberToggle()<cr>
    
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

" Scroll Other window
nmap ,d <C-W>W<C-D><C-W>W
nmap ,u <C-W>W<C-U><C-W>W

" Close the current buffer
map <leader>x :Bclose<cr>

" " Close all the buffers
" map <leader>ba :1,300 bd!<cr>

" Use the arrows to switch buffers
map <right> :bn<cr>
map <left> :bp<cr>
map <up> :LustyJuggler<cr>
map <down> <ESC>

" Close all the buffers
map <leader>r :LustyBufferExplorer<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-a> <esc>a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Bubbbling lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easier non-interactive command insertion
" "nnoremap <Space> :
" https://github.com/carlhuda/janus/blob/master/vimrc

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Easy Motion config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Needed to enable Highlighting for the Easymotion plugin
hi link EasyMotionTarget ErrorMsg



" Make EasyMotion more yellow, less red
hi clear EasyMotionTarget
hi! EasyMotionTarget guifg=yellow

nmap ,<Tab> ,,w
nmap ,<S-Tab> ,,b








" Powerling statusbar fancy symbols"
let g:Powerline_symbols = 'unicode'

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
" nnoremap <silent><A-j> m`:silent +g/\\m^\\s*$/d<CR>``:noh<CR>
" nnoremap <silent><A-k> m`:silent -g/\\m^\\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Tabularize
if exists(":Tab")
  nmap <leader>a\| :Tab /\|<CR>
  vmap <leader>a\| :Tab /\|<CR>
  nmap <leader>a= :Tab /=<CR>
  vmap <leader>a= :Tab /=<CR>
  nmap <leader>a: :Tab /:\zs<CR>
  vmap <leader>a: :Tab /:\zs<CR>
endif

" Taglist
set tags=./tags;
map <leader>l :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60

" Increase Max file limit for Command-T"
let g:CommandTMaxFiles=30000

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'



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
    au BufRead,BufNewFile Vagrantfile setfiletype ruby
    au BufRead,BufNewFile Termfile setfiletype ruby
    au BufRead,BufNewFile Guardfile setfiletype ruby
    au BufRead,BufNewFile Rakefile  setfiletype ruby
    au BufRead,BufNewFile *.rabl  setfiletype ruby
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

" incompatible with rails asset pipeline
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" AutoClose
" let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'} 
" let g:AutoCloseProtectedRegions = ["Character"] 



" map <Leader>d :!rocco % >  /dev/null &<CR>
" imap <Leader>d <ESC>:!rocco % > /dev/null &<CR>
" not working with filetype detection
autocmd FileType coffee :call DoCoffeeScriptMappings()
function! DoCoffeeScriptMappings()
    map <Leader>cw :CoffeeCompile<CR>
endfunction


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



" ========================================
" RSI Prevention - keyboard remaps
" ========================================
" Certain things we do every day as programmers stress
" out our hands. For example, typing underscores and
" dashes are very common, and in position that require
" a lot of hand movement. Vim to the rescue
"
" Now using the middle finger of either hand you can type
" underscores with apple-k or apple-d, and add Shift
" to type dashes

" Doesn't work"
" imap <silent> <D-k> _
" imap <silent> <D-d> _
" imap <silent> <D-K> -
" imap <silent> <D-D> -

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

function! DoRubyMappings()
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "  Surroung configuration
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Ruby
  " Use v or # to get a variable interpolation (inside of a string)}
  " ysiw#   Wrap the token under the cursor in #{}
  " v...s#  Wrap the selection in #{}
  let g:surround_113 = "#{\r}"   " v
  let g:surround_35  = "#{\r}"   " #

  " Select text in an ERb file with visual mode and then press s- or s=
  " Or yss- to do entire line.
  let g:surround_45 = "<% \r %>"    " -
  let g:surround_61 = "<%= \r %>"   " =



  " create <%= foo %> erb tags using Ctrl-k in insert mode
  imap <silent> <C-K> <%=   %><Esc>3hi
  "
  " " create <%= foo %> erb tags using Ctrl-j in insert mode
  imap <silent> <C-J> <%  %><Esc>2hi

  " Surround a word with #{ruby interpolation}
  map ,# ysiw#
  vmap ,# c#{<C-R>"}<ESC>

  " bind control-l to hashrocket
  " imap <buffer> ji <Space>=><Space>
  imap <c-l> <space>=><space>

  " convert word into ruby symbol
  imap <buffer> <C-y> <C-o>b:<Esc>Ea
  " imap <C-s> <C-o>b:<Esc>Ea
  " nmap <buffer> <C-k> lbi:<Esc>E"
  
  inoremap <buffer> [[ <Esc>?def <CR>
  inoremap <buffer> ]] <Esc>/def <CR>

  nmap <buffer> [[ ?def <CR>
  nmap <buffer> ]] /def <CR>

  inoremap <buffer> ; :
  inoremap <buffer> ;; ;
endfunction

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
