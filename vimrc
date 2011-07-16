" --------------------------------------------------------------
" file:  ~/.vimrc
" author:   Fl4t
" --------------------------------------------------------------

" F2  : orthographe
" F3  : numéro
" F4  : mode coller
" F5  : warp/nowarp
" F6  : cursorline
" F7  : tab/espace
" F8  : ident-guides
" F9  :
" F10 : Gundo
" F11 : NerdTree
" F12 : Taglist

" ,cd : ce rendre dans le répertoire du fichier courant
" ,fn : faute suivante
" ,fp : faute précédente
" ,bda : supprime tout les buffers
" <right> : buffer précédent
" <left> : buffer suivant
" <S-Enter> : insère une ligne vide au dessus
" <Enter> : insère une ligne en dessous

""General""{{{
" Plugin Pathogen (à mettre devant filetype)
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
set ofu=syntaxcomplete#Complete "OmniComp
set complete=.,w,b,t          " paramètre de complétion
set nocompatible              " leave the old ways behind...
set history=400               " historique des commandes vim
set shell=/bin/bash           " langage shell par défaut
set encoding=utf-8            " UTF-8
set fileencoding=utf-8        " UTF-8
set fileformat=unix
set backspace=2               " règle le comportement de backspace
set mouse=a                   " active la souris pour toujours
set mousehide                 " hide mouse when typing
let mapleader=","             " change la touche par défaut de vim qui est \
set clipboard+=unnamed        " yank et aussi copier en mémoire tampon
set ttyfast                   " affichage rapide en console
set ttyscroll=1               " désactive le scroll des tty
" Set the forward slash to be the slash of note.  Backslashes suck
" This is really only applicable to Windows but I like to have a vimrc
" that works no matter what OS I'm currently on
" c'est Derek qui le dit alors chut.
set shellslash
set cpoptions +=$             " pour avoir un dollars lorsque l'on change, touche c
set virtualedit=all           " pour ce déplacer même si il n'y a pas de caractère
set hidden                    " permet le switch de buffer meme si on a pas sauvegardé
set lazyredraw                " Don't update the display while executing macros

" Map keys to toggle functions"{{{
function! MapToggle(key, opt)
    let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
    exec 'nnoremap '.a:key.' '.cmd
    exec 'inoremap '.a:key." \<C-O>".cmd
endfunction

command! -nargs=+ MapToggle call MapToggle(<f-args>)
" Keys & functions
MapToggle <F3> number
MapToggle <F4> paste
MapToggle <F5> wrap
MapToggle <F6> cursorline
MapToggle <F7> list
"}}}

nmap <silent> <leader>ev :e $MYVIMRC<CR> " Modifier le vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR> " Sourcer le vimrc
"}}}
""Interface""{{{
set number                    " voir les lignes par défaut
set numberwidth=1             " 1 ligne = 1 numéro
set shortmess=aTi             " format of messages (avoids 'hit editednter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility"
set showmode                  " montre le mode dans lequel je suis
set showcmd                   " voir les touches tapées
set wildmenu                  " menu en carré
set wim=list:longest,full     " la tronche des possibilité de complétion
set wildignore=*.o,*.bak,*.pyc,*.swp,*.jpg,*.gif,*.png
set visualbell t_vb=          " pas de clignotement
set noerrorbells              " pas de clignotement quand erreur
set guicursor=a:blinkon0      " pas de curseur qui clignote
set cmdheight=2               " 2 lignes en dessous de statusline
set laststatus=2              " toujours voir la barre de statut
set stl=%f\ %m\ %r\ Buf:\ #%n\ [%b][0x%B]
set stl+=\ [%{getcwd()}]      " current directory
set stl+=\ %{fugitive#statusline()}
set stl+=\ %{Tlist_Get_Tagname_By_Line()}
set stl+=%=%-14.(%l/%L,%c%V%)\ %p%% " Right aligned file nav info"
""}}}
""Couleurs""{{{
syntax on               " activer les couleurs
" colorise au lancement du fichier
" plus long mais meilleur rendu
syntax sync fromstart
autocmd BufEnter * :syntax sync fromstart

" Réglages pour le php
"let php_sql_query = 1
let php_baselib = 1
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_folding = 1
let php_parent_error_close = 1
" colourscheme for the 8 colour linux term
set t_Co=256
if &t_Co < 256
    colorscheme miro8
else
    colorscheme miromiro
endif
" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if exists('*HexHighlight()')
  nmap <leader>h :call HexHighlight()<Return>
endif
"}}}
""Indentation""{{{
set expandtab           " insère des espaces au lieu de tab
set tabstop=4           " nombre d'espaces par tab
set softtabstop=4       " nombre d'espace pour une tab en mode édition
set shiftwidth=4        " pareil mais pour >> <<
set shiftround          " tab toujours multiple de shiftwidth
" Supprime automatiquement les espaces de fin de ligne
autocmd BufWritePre * :%s/\s\+$//e "}}}
""Édition""{{{
set nostartofline       " conserve la colonne
set showmatch           " affiche les paires de parenthèses (),{},[]
set matchtime=2         " durée de cette affichage
let g:loaded_matchparen=1 " désactive le sur-lignage des paires de parenthèses
set scrolloff=10        " laisser des lignes en dessus et dessous"
set nowrap              " pas de retour a la ligne par défaut
set linebreak           " Coupe pas les mots au warp

"orthographe"{{{
" mapping français
map <silent> <F2> "<Esc>:silent setlocal spell! spelllang=fr<CR>"
" pas de correction orthographique par défaut
set nospell
map <leader>fn ]s
map <leader>fp [s"}}}

" saute a la dernière position du curseur"{{{
if has("autocmd")
    autocmd BufReadPost * if line("'\"")>0 && line("'\"")<=line("$")|exe "normal g`\""|endif
    autocmd BufRead *.txt set wm=1 " limit width to n cols for txt files
endif"}}}

set diffopt=filler,iwhite,vertical  " Options pour le mode diff
map <leader>bda :1,300 bd!<cr> " Close all the buffers
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
" Permet de voir les espaces et tab en trop
set nolist
set listchars:tab:▸\ ,trail:✖
" permet de pouvoir enregistrer sans taper sudo
cmap w!! w !sudo tee % > /dev/null
" Récupère la sélection après une indentation shift
vnoremap <silent> < <gv
vnoremap <silent> > >gv
" Change de répertoire automatiquement ou ce trouve le fichier
autocmd BufEnter * lcd %:p:h
"}}}
""Replis""{{{
set foldenable          " ferme les replis existant par défaut
set foldmethod=marker   " c'est les marqueurs qui délimite les replis
set foldminlines=2      " nombre de ligne mini pour replis
set fillchars=fold:·    " affiche des ... après le nom du replis
" Ces commandes ouvre les replis
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo"
"set foldcolumn=0        " pas de marge a gauche pour les replis
"}}}
""Recherche""{{{
set hlsearch            " surligne les recherches
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " uppercase causes case-sensitive search
set wrapscan            " la recherche reprend au depart
" Enlève le sur-lignage après une recherche
:noremap <silent> <Space> :silent noh<Bar>echo<CR>
" Mode magic pour les expressions régulières
set magic"}}}
""Buffer/Fenêtres/Tabs""{{{
set hidden          " Pour pouvoir changer de buffer sans sauvegarder
set wmh=1           " Nombre minimal de lignes pour une fenêtre
" Navigation des fenêtres facile
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
set splitbelow          " ouvre un nouveau fichier en dessous du précédent
"cd to the directory containing the file in the buffer
nmap  <leader>cd :lcd %:h<CR>
"}}}
""Fichier/Backup""{{{
set autoread        " recharge auto quand un fichier est modifié
set autowrite       " sauvegarde auto quand on quitte ou qu'on change de buffer
set backup          " sauvegarde
set writebackup     " écrit le backup avant d'écrire le vrai fichier
set backupdir=$HOME/.savefile " dossier des .backup
set directory=$HOME/.swap " dossier des .swp"}}}
""Plugins""{{{
" indent-guides plugin
let g:indent_guides_enable_on_vim_startup=1 " active les guides au démarrage
let g:indent_guides_start_level=2 " active a partir du deuxième niveau
let g:indent_guides_guide_size=1 " largeur de 1 caractère

" SuperTab plugin
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" Plugin VB.NET highlighting
autocmd BufNewFile,BufRead *.vb set ft=vbnet

"hexhighlight
source ~/.vim/plugins/hexHighlight.vim
if exists('*HexHighlight()')
  nmap <leader>h :call HexHighlight()<Return>
endif

" Plugin Indent-guides
nnoremap <silent> <F8> :IndentGuidesToggle<CR>

" Plugin MRU
let MRU_Add_Menu=0

" Plugin Gundo
nnoremap <silent> <F10> :GundoToggle<CR>

" Plugin NERD Tree
nnoremap <silent> <F11> :NERDTreeToggle<CR>
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]

" Plugin Taglist
nnoremap <silent> <F12> :TlistToggle<CR>

" Donne le chemain pour le plugin Taglist de vim.
let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'
" Mettre la fenetre taglist a droite.
let Tlist_Use_Right_Window = 1

" Plugin MRU
noremap <silent> <Leader>m :MRU<cr>

"}}}
""Langage C""{{{
noremap <leader>C <c-\><c-n>:!gcc -Wall % -o %<.x<cr>
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"}}}
