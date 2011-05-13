" --------------------------------------------------------------
" file:  ~/.vimrc
" author:   Fl4t
" --------------------------------------------------------------

" Plugin Pathogen (a mettre devant filetype)
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on

if &t_Co > 256
   colorscheme miromiro 
endif
set guifont=Envy\ Code\ R:h13
set nocompatible        " leave the old ways behind...
syntax on               " activer les couleurs
set noerrorbells        " pas de clignotement quand erreur
set textwidth=0         " pas de limite de largeur du texte
set shortmess=atI       " donne des messages court avec ^G et supprime le :tutor
set mousehide           " hide mouse when typing
autocmd winleave * setl nocursorline " quand je change le focus, il n'y a pu de curseur
autocmd winenter * setl cursorline " quand je reprend le focus, remets le curseur
set visualbell t_vb=    " pas de clignotement
set guicursor=a:blinkon0 " pas de curseur qui clignote
set nowrap              " pas de retour a la ligne par defaut
set showmode            " montre le mode dans lequel je suis
set showcmd             " voir les touches tapées
set showmatch           " affiche les paires de parenthèses (),{},[]
set splitbelow          " ouvre un nouveau fichier en dessous du précédent
set clipboard+=unnamed  " yank et aussi copier en mémoire tampon
set encoding=utf-8      " UTF-8
set fileencoding=utf-8  " UTF-8
set backspace=2         " regle le comportement de backspace
set backup              " sauvegarde
set number              " voir les lignes par defaut
set linebreak           " attempt to wrap lines cleanly
set wildmenu            " menu en carré
set wildmode=list:longest,full " la tronche des possibilité de completion
let g:loaded_matchparen=1

" tabs and indenting
set expandtab           " insert des éspaces au lieu de tab
set tabstop=3           " nombre d'éspaces par tab 
set shiftwidth=3        " pareil mais pour >> <<
set textwidth=150       " largeur possible du texte
set shiftround          " arrondi l'indentation
set scrolloff=10        " laisser des lignes en dessus et dessous

" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
" c'est Derek qui le dit alors chut.
set shellslash
set cpoptions +=$       " pour avoir un dollars lorsque l'on change, touche c
set virtualedit=all     " pour ce déplacer même si il n'y a pas de caractère
set hidden              " detruit un buffer apres l'avoir fermé
set lazyredraw          " Don't update the display while executing macros

" searching
set hlsearch            " surligne les recherches
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " uppercase causes case-sensitive search
set wrapscan            " la recherche reprend au depart

set backupdir=$HOME/.savefile " sauvegarder les fichier ~ dans ~/.savefile
set shell=/bin/bash     " langage shell par default

" Replis & Co.
set foldenable          " ferme les replis existant par defaut
set foldmethod=marker   " c'est les markeurs qui délimite les replis {{{}}}
set foldminlines=5      " nombre de ligne mini pour replis
set fillchars=fold:·    " 
set ttyfast             " affichage rapide en console
"set ttyscroll=1         " désactive le scroll des tty
set selection=inclusive " comportement de la selection
" Ces commandes ouvre les replis
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" --------------------------------------------------------------
" misc
" --------------------------------------------------------------

" indent-guides plugin
let g:indent_guides_enable_on_vim_startup=1 " active les guides au démarrage
let g:indent_guides_start_level=2 " active a partir du deuxième niveau
let g:indent_guides_guide_size=1 " largeur de 1 caractère
let g:indent_guides_auto_colors = 0 " désactive les couleurs automatique du thème
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#202020   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#202020   ctermbg=4

if has("autocmd")
   " always jump to the last cursor position
   autocmd BufReadPost * if line("'\"")>0 && line("'\"")<=line("$")|exe "normal g`\""|endif
   autocmd BufRead *.txt set tw=150 " limit width to n cols for txt files
   "autocmd FileType tex set tw=150   " wrap at 150 chars for LaTeX files
endif

" VB.NET highlighting
autocmd BufNewFile,BufRead *.vb set ft=vbnet

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
   set mouse=a
endif

" LaTeX settings
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor='latex'

" permet de pouvoir enregistrer sans taper sudo
cmap w!! w !sudo tee % > /dev/null

let php_sql_query = 1 "Coloration des requetes SQL
let php_htmlInStrings = 1 "Coloration des balises HTML

" Barre de statut & Co.
set laststatus=1 " montre la ligne de statut que si il y a plus de 2 fenetres
fun! <SID>SetStatusLine() " Set up the status line
   let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
   let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
   let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
   execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun
call <SID>SetStatusLine()

" pas de correction orthographique par défaut
set nospell

" automatique pour les fichiers .txt et .tex
augroup filetypedetect
au BufNewFile,BufRead *.txt setlocal spell spelllang=fr
au BufNewFile,BufRead *.tex setlocal spell spelllang=fr
augroup END

" painless spell checking
" for French, you'll need
" wget http://ftp.vim.org/pub/vim/runtime/spell/fr.utf-8.sug
" wget http://ftp.vim.org/pub/vim/runtime/spell/fr.utf-8.spl
" which you may move into ~/.vim/spell
function s:spell_fr()
   if !exists("s:spell_check") || s:spell_check == 0
      echo "Correction orthographique activée (français)"
      let s:spell_check = 1
      "setlocal spell spelllang=fr
      else
      echo "Correction orthographique désactivée"
      "let s:spell_check = 0
      setlocal spell spelllang=
   endif
endfunction

" mapping français
noremap <F2> :call <SID>spell_fr()<CR>
inoremap <F2> <C-o>:call <SID>spell_fr()<CR>
vnoremap <F2> <C-o>:call <SID>spell_fr()<CR>

" --------------------------------------------------------------
" key
" --------------------------------------------------------------

" change la touche par defaut de vim qui est \
let mapleader="," 

" Recharger vimrc apres modification
:nmap <Leader>rv :source $MYVIMRC

" Modifier le vimrc
:nmap <Leader>mv :e $MYVIMRC

" Changement de racourcis pour supertab
"let g:SuperTabMappingForward = '<c-space>'
"let g:SuperTabMappingBackward = '<s-c-space>'
"let g:SuperTabDefaultCompletionType = "context"

" Enleve le surlignage apres une recherche
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Use Q for formatting the current paragraph (or visual selection)
vmap Q gq
nmap Q gqap

" Utiliser p en mode visuel pour remplacer le texte selectionne par le text
" yanker precedement
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Navigation des fenetres facile
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"simple matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Plugin NERD Tree
nnoremap <silent> <F8> :NERDTreeToggle<CR>

" Plugin Taglist
nnoremap <silent> <F12> :TlistToggle<CR>
