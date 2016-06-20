"Voundle area
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'DfrankUtil'
Bundle 'Tagbar'
Bundle 'SuperTab'
Bundle 'winmanager'
Bundle 'vimprj'
Bundle 'pathogen.vim'
Bundle 'indexer.tar.gz'
Bundle 'a.vim'
Bundle 'ack.vim'
Bundle 'grep.vim'
Bundle 'Indent-Guides'
Bundle 'minibufexpl.vim'
Bundle 'Syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/powerline'
Bundle 'aceofall/gtags.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'sjl/gundo.vim'
Bundle 'Lokaltog/vim-powerline'
"markdown plugin
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
call vundle#end()

filetype plugin indent on
syntax  enable
syntax on

let g:Powerline_colorscheme='solarized256'
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set laststatus=2
set ruler
set number
set cursorline
set cursorcolumn
set hlsearch
set mouse=

"color template and background
set background=dark
"colorscheme solarized
"colorscheme github
colorscheme molokai
"colorscheme phd
set gcr=a:block-blinkon0
set incsearch
set ignorecase
set nocompatible
set wildmenu

"leader key
let mapleader=";"

" line front and tail 
nmap lb 0
nmap le $

" system clipboard ctrl
vnoremap <Leader>y "+y
nmap <Leader>p "+p

"window ctrl
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>

" traverse windows
nnoremap nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j


"  indexer invoke ctags para.
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" indent_guids
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

set foldmethod=indent
set foldmethod=syntax
set nofoldenable

"  a plugin switch betweenheader and  source file
nmap <Leader>ch :A<CR>
nmap <Leader>sch :AS<CR>

"tagbar tl:tag list
let tagbar_left=0 
nnoremap <Leader>tl :TagbarToggle<CR> 
let tagbar_width=35 
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'd:macros:1',
         \ 'g:enums',
         \ 't:typedefs:0:0',
         \ 'e:enumerators:0:0',
         \ 'n:namespaces',
         \ 'c:classes',
         \ 's:structs',
         \ 'u:unions',
         \ 'f:functions',
         \ 'm:members:0:0',
         \ 'v:global:0:0',
         \ 'x:external:0:0',
         \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

"minibuf bl: buffer list nb/pb:next/prior buf
map <Leader>bl :MBEToggle<cr>
map <Leader>nb :MBEbn<cr>
map <Leader>pb :MBEbp<cr>

"winManager: useless now , use <leader> fl + <C-p> instead!
"let g:winManagerWindowLayout="FileExplorer,TagbarToggle"
"let g:winManagerWidth=25
"let g:defaultExplorer=0
"nmap  wm :WMToggle<cr>

"NerdTree fl: file list
"autocmd vimenter * NERDTree "start with vim automatically
map <leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=25
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" add any cscope database in current directory  
set cscopeprg='gtags-cscope' " use gtags-cscope instead of cscope

if filereadable("cscope.out")  
    cs add cscope.out 
endif
:set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>


set tags+=~/.vim/stdcpp.tags
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>*'
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap <F4> :YcmDiags<CR>

"gtags.vim setting  gc: goto caller
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

"nnoremap <Leader> :Gtags<CR><CR> 
"nnoremap <Leader> :Gtags -s<CR><CR> 
"nnoremap <Leader> :Gtags -g<CR><CR>
nmap <Leader>gc  :Gtags -r<CR><CR>

"quickfix
nmap <Leader>gn :cn<cr>
nmap <Leader>gp :cp<cr>

"use supertab to make YCM and utilsinp work together ^_^
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ultisnips_java_brace_style = "nl"
"let g:UltiSnipsSnippetDirectories = "~/.vim/bundle/ultisnips/mysnip"
let g:SuperTabDefaultCompletionType = '<C-n>'

"scrooloose/nerdcommente :
"<leader> cc to comment  <leader> cu to un-comment
"<leader> c <space> : auto mode

"Gundo
nnoremap <Leader>u :GundoToggle<CR>

"markdown
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1

autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
