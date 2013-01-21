set nocompatible               " be iMproved

" Install the Vundle plugin manager if it doesn't already exist
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
endif

filetype off                   " must be off before Vundle has run

set runtimepath+=~/.vim/bundle/vundle/

call vundle#rc()

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ

" List of vim plugins to install
Bundle 'gmarik/vundle'
Bundle "git://github.com/mileszs/ack.vim.git"
Bundle "git://github.com/vim-scripts/c.vim.git"
Bundle "git://github.com/sjbach/lusty.git"
Bundle "git://github.com/tpope/vim-rvm.git"
Bundle "git://github.com/tpope/vim-endwise.git"
Bundle "git://github.com/tpope/vim-fugitive"
Bundle "git://github.com/tpope/vim-haml.git"
Bundle "git://github.com/tpope/vim-rails.git"
Bundle "git://github.com/tpope/vim-surround.git"
Bundle "git://github.com/chrismetcalf/vim-yankring.git"
Bundle "git://github.com/chrismetcalf/vim-taglist.git"
Bundle "git://github.com/scrooloose/syntastic.git"
Bundle "git://github.com/scrooloose/nerdtree.git"
Bundle "git://github.com/sophacles/vim-bundle-sparkup.git"
Bundle "git://github.com/panozzaj/vim-autocorrect.git"
Bundle "git://github.com/sjl/gundo.vim.git"
Bundle "git://github.com/godlygeek/tabular.git"
Bundle "git://github.com/vim-scripts/hexman.vim.git"
Bundle "git://github.com/vim-scripts/Gist.vim.git"
" Do I really need this?   Don't know what it does
" Bundle "git://github.com/vim-scripts/L9.git"
" Bundle "git://github.com/clones/vim-fuzzyfinder.git"
Bundle "git://github.com/Townk/vim-autoclose.git"
Bundle "git://github.com/Bogdanp/rbrepl.vim.git"
Bundle 'git://github.com/altercation/vim-colors-solarized.git'
Bundle "git://github.com/rson/vim-conque.git"
Bundle "git://github.com/xolox/vim-session.git" 
Bundle "git://github.com/tsaleh/vim-tcomment.git"
Bundle "git://github.com/kana/vim-textobj-user.git"
Bundle "git://github.com/nelstrom/vim-textobj-rubyblock.git"
Bundle 'git://git.wincent.com/command-t.git'
Bundle "git://github.com/gmarik/snipmate.vim.git"
Bundle "git://github.com/krisleech/snipmate-snippets.git"
Bundle "git://github.com/kchmck/vim-coffee-script.git"
Bundle "git://github.com/Lokaltog/vim-easymotion.git"
Bundle "git://github.com/Lokaltog/vim-powerline.git"
Bundle "https://github.com/ervandew/supertab"
Bundle "jQuery"
Bundle "git://github.com/jnwhiteh/vim-golang.git"
" Bundle "git://github.com/nathanaelkane/vim-indent-guides.git"

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

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
" call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()



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


" This remaps easymotion to show us only the left
" hand home row keys as navigation options which 
" may mean more typing to get to a particular spot
" but it'll all be isolated to one area of the keyboard
call EasyMotion#InitOptions({
\   'leader_key'      : '<Leader><Leader>'
\ , 'keys'            : 'fjdksewoavn'
\ , 'do_shade'        : 1
\ , 'do_mapping'      : 1
\ , 'grouping'        : 1
\
\ , 'hl_group_target' : 'Question'
\ , 'hl_group_shade'  : 'EasyMotionShade'
\ })

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
" au BufWritePost *.coffee silent CoffeeMake!
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
" let coffee_compile_vert = 1

" AutoClose
" let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'} 
" let g:AutoCloseProtectedRegions = ["Character"] 


"autocmd BufWritePost,FileWritePost *.coffee silent !docco <afile> > /dev/null &

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

autocmd User Rails :call DoConfigureRails()
function! DoConfigureRails()
    map <Leader>m :Rmodel<CR>
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
    "map <Leader>sv :RSview
    "map <Leader>u :Runittest
    map <Leader>vc :RVcontroller
    map <Leader>vf :RVfunctional
    map <Leader>vu :RVunittest<CR>
    map <Leader>vm :RVmodel
    map <Leader>vv :RVview 

    map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
    map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
    map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
    map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
    map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
    map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
    map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
    map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>

    " View routes or Gemfile in large split
    map <leader>gr :e config/routes.rb<cr>
    map <leader>gg :e Gemfile<cr>

    " Skip to Models and Views
    map <Leader>m :Rmodel 
    imap <Leader>m <ESC>:Rmodel<CR>
    map <Leader>v :Rview 
    imap <Leader>v <ESC>:Rview<CR>

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

    " Ruby mapppings from Ben Orenstein
     vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
""    map <Leader>cc :!cucumber %<CR>
""    map <Leader>co :TComment<CR>
""    map <Leader>d odebugger<cr>puts 'debugger'<esc>:w<cr>
    "map <Leader>gac :Gcommit -m -a <LEFT>
    "map <Leader>gc :Gcommit -m <LEFT>
    "map <Leader>gs :Gstatus<CR>
""    map <Leader>fa :sp test/factories.rb<CR>
""    map <Leader>fix :cnoremap % %<CR>
""    map <Leader>i mmgg=G`m<CR>
    "map <Leader>l :!ruby <C-r>% \| less<CR>
    "map <Leader>s :!ruby -Itest -Ispec %<CR>
    "map <Leader>s :!clear; rspec spec<CR>
    "imap <Leader>s <ESC>:!clear; rspec spec<CR>
    "map <Leader>rd :!bundle exec rspec % --format documentation<CR>
    "imap <Leader>a ,w,s
    "map <Leader>a ,w,s
    "map <Leader>o ?def <CR>:nohl<CR>wzy$:!ruby -Itest <C-r>% -n <C-r>z<CR>
    "map <Leader>p :set paste<CR>i
    "map <Leader>rw :%s/\s\+$//

endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "Nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERTree Plugin
":"nmap ,n :NERDTreeClose<CR>:NERDTreeToggle<CR>
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
let NERDTreeMouseMode=2           " Use a single click to fold/unfold directories and a double click to open files
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeWinSize = 50 
" open file browser
map <leader>p :NERDTreeToggle<cr>
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


