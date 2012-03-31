" --------------------------------------------------------------
" file:  ~/.vimrc
" author:   Fl4t
" --------------------------------------------------------------

" F2  : orthographe
" F3  :
" F4  :
" F5  :
" F6  :
" F7  :
" F8  :
" F9  : Gundo
" F10 : Toggle List
" F11 : NerdTree
" F12 : Taglist

" ,ev : edit vimrc
" ,sv : source vimrc
" ,h  : hexhighlight
" ,fn : faute suivante
" ,fp : faute précédente
" ,cd : aller au dossier du fichier courant
" ,bda : ferme tout les buffers
" <right> : buffer précédent
" <left> : buffer suivant
" <S-Enter> : insère une ligne vide au dessus
" <Enter> : insère une ligne en dessous

"General"{{{
" Pathogen 2.0
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect() " Activer pathogen
Helptags               " Pour sourcer les help.txt
filetype plugin indent on
set complete=.,w,b,t   " paramètre de complétion
set nocompatible       " leave the old ways behind...
set history=400        " historique des commandes vim
set shell=/bin/zsh     " langage shell par défaut
set encoding=utf-8     " UTF-8
set fileencoding=utf-8 " UTF-8
set fileformat=unix
set backspace=2        " règle le comportement de backspace
set mouse=a            " active la souris pour toujours
set mousehide          " hide mouse when typing
let mapleader=","      " change la touche par défaut de vim qui est \
set clipboard=unnamed  " yank et aussi copier en mémoire tampon
set shellslash         " c'est Derek qui le dit alors chut.
set cpoptions +=$      " pour avoir un dollars lorsque l'on change, touche c
set virtualedit=all    " pour ce déplacer même si il n'y a pas de caractère
set hidden             " permet le switch de buffer meme si on a pas sauvegardé
set lazyredraw         " Don't update the display while executing macros
set tm=500             " Délai raccourci-clavier
set gdefault           " Ne pas taper le g de /truc/truc/g
set nospell            " pas de correction orthographique par défaut
set magic              " Mode magic pour les expressions régulières
"}}}
"Interface"{{{
"set relativenumber            " Numero de ligne dynamique à la position
set number                    " (temporaire) relativenumber lag trop
set numberwidth=1             " 1 ligne = 1 numéro
set shortmess=aTi             " format of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility"
set noshowmode                " vim-powerline le fait très bien
set showcmd                   " voir les touches tapées
set wildmenu                  " menu en carré
set wim=list:longest,full     " la tronche des possibilité de complétion
set wildignore=*.o,*.bak,*.pyc,*.swp,*.jpg,*.gif,*.png
set visualbell t_vb=          " pas de clignotement
set noerrorbells              " pas de clignotement quand erreur
set guicursor=a:blinkon0      " pas de curseur qui clignote
set cmdheight=2               " 1 ligne en dessous de statusline
set laststatus=2              " toujours voir la barre de statut
""}}}
"Couleurs"{{{
syntax on               " activer les couleurs
colorscheme solarized   " colorscheme
set bg=dark             " version sombre de solarized
"}}}
"Indentation"{{{
set expandtab           " insère des espaces au lieu de tab
set tabstop=2           " nombre d'espaces par tab
set softtabstop=2       " nombre d'espace pour une tab en mode édition
set shiftwidth=2        " pareil mais pour >> <<
set shiftround          " tab toujours multiple de shiftwidth
"}}}
"Édition"{{{
set nostartofline                   " conserve la colonne
let g:loaded_matchparen=1           " désactive le sur-lignage des paires de parenthèses
set scrolloff=10                    " laisser des lignes en dessus et dessous"
set nowrap                          " pas de retour a la ligne par défaut
set diffopt=filler,iwhite,vertical  " Options pour le mode diff

" Permet de voir les espaces et tab en trop
set nolist
set listchars=tab:▸\ ,trail:✖,eol:¬
"}}}
"Replis"{{{
set foldenable          " ferme les replis existant par défaut
set foldmethod=marker   " c'est les marqueurs qui délimite les replis
set foldminlines=2      " nombre de ligne mini pour replis
set fillchars=fold:·    " affiche des ... après le nom du replis

" Ces commandes ouvre les replis
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo"
"}}}
" Commandes"{{{
" Aller au dossier du fichier courant
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Mapping pour éditer le vimrc et le sourcer
nmap <silent> <leader>ev :e $MYVIMRC<CR> " Modifier le vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR> " Sourcer le vimrc

" mapping français
map <silent> <F2> "<Esc>:silent setlocal spell! spelllang=fr<CR>"

" faute suivante/précédente
map <leader>fn ]s
map <leader>fp [s

" Close all the buffers
map <leader>bda :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Use Q for formatting the current paragraph (or visual selection)
vmap Q gq
nmap Q gqap

" Utiliser p en mode visuel pour remplacer le texte sélectionne par le texte
" yanker précédemment
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

"simple matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" awesome, inserts new line without going into insert mode
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" Voir les éspaces/tab en trop
nnoremap <F10> :set nolist!<CR>

" permet de pouvoir enregistrer sans taper sudo
cmap w!! w !sudo tee % > /dev/null

" Récupère la sélection après une indentation shift
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" Enlève le sur-lignage après une recherche en tapant espace
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Navigation des fenêtres facile
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"hexhighlight
nmap <leader>h :call HexHighlight()<Return>

" Plugin MRU
noremap <silent> <Leader>m :MRU<cr> let MRU_Add_Menu=0

" Plugin NERD Tree
nnoremap <silent> <F11> :NERDTreeToggle<CR>

" Plugin TagList
nnoremap <silent> <F12> :TlistToggle<CR>

" Plugin Gundo
nnoremap <silent> <F9> :GundoToggle<CR>

"}}}
" autoCommand"{{{
if has("autocmd")
  " Plugin VB.NET highlighting
  au BufNewFile,BufRead *.vb set ft=vbnet

  " Moteur de template twig
  au BufNewFile,BufRead *.twig set ft=html

  " Supprime automatiquement les espaces de fin de ligne
  au BufWritePre * :%s/\s\+$//e

  " saute a la dernière position du curseur sauf pour les commits
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g`\"" | endif

  " Fonctions pour fichiers LaTeX
  au BufEnter,BufNewFile *.tex	exe Flatex()

  " Fonctions pour fichiers C
  au BufEnter,BufNewFile *.c	exe FlangageC()

  " Fonctions pour fichiers Java
  au BufEnter,BufNewFile *.java exe Fjava()
endif
"}}}
"Recherche"{{{
set hlsearch            " surligne les recherches
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " uppercase causes case-sensitive search
set wrapscan            " la recherche reprend au depart
"}}}
"Buffer/Fenêtres/Tabs"{{{
set hidden          " Pour pouvoir changer de buffer sans sauvegarder
set wmh=1           " Nombre minimal de lignes pour une fenêtre
set splitbelow      " ouvre un nouveau fichier en dessous du précédent
"}}}
"Fichier/Backup"{{{
set undofile    " undo fonctionne après avoir fermé le fichier
set autoread    " recharge auto quand un fichier est modifié
set autowrite   " sauvegarde auto quand on quitte ou qu'on change de buffer
set backup      " sauvegarde
set writebackup " écrit le backup avant d'écrire le vrai fichier
set backupdir=$HOME/.vim/savefile " dossier des .backup
set directory=$HOME/.vim/swapfile " dossier des .swp
set undodir=$HOME/.vim/undofile   " dossier des .un
"}}}
"Plugins"{{{
" indent-guides
let g:indent_guides_start_level = 2

" vim-powerline
let g:Powerline_symbols = 'fancy' "fancy symbols

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
      \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
      \ '\.embed\.manifest$', '\.embed\.manifest.res$',
      \ '\.intermediate\.manifest$', '^mt.dep$' ]

" Plugin Taglist
hi! link TagListFileName Underlined
" Donne le chemain pour le plugin Taglist de vim.
let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'
" Mettre la fenetre taglist a droite.
let Tlist_Use_Right_Window = 1

" Plugin MRU
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
"}}}
"Langages"{{{
"Langage C"{{{
fun! FlangageC()
  noremap <leader>C <c-\><c-n>:!gcc -Wall % -o %<.x<cr>
  setlocal formatoptions-=c formatoptions-=r formatoptions-=o
endf
"}}}
"PHP"{{{
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_folding = 1
let php_parent_error_close = 1
"}}}
"LaTeX"{{{
function! Flatex()
  " Largeur de texte standard
  set tw=72

  " filetype
  set ft=tex

  " Sauvegarde et compilation PDFLaTeX (-> PDF)
  noremap <leader>C <ESC>:w<CR>:!pdflatex %<.tex<CR><CR>

  " Voir le pdf créé
  noremap <leader>pdf <ESC>:w<CR>:!open %<.pdf<CR><CR>
endfunction
"}}}
"Java"{{{
function! Fjava()
  " Sauvegarde et compilation
  noremap <leader>C <ESC>:w<CR>:!javac %<.java<CR>
endfunction
"}}}
