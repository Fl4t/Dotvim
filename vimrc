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

" jj : <Esc>
" ,v : split vertical + switch
" ,h : split horizontal + switch
" ,cd : ce rendre dans le repertoire du fichier courant
" ,fn : faute suivante
" ,fp : faute précédente
" ,bda : delete tout les buffers
" <right> : buffer précédent
" <left> : buffer suivant
" <S-Enter> : insert une ligne vide au dessus
" <Enter> : insert une ligne en dessous

""General""{{{
" Plugin Pathogen (a mettre devant filetype)
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
set ofu=syntaxcomplete#Complete "OmniComp
set nocompatible              " leave the old ways behind...
set history=400               " historique des commandes vim
set shell=/bin/bash           " langage shell par default
set encoding=utf-8            " UTF-8
set fileencoding=utf-8        " UTF-8
set fileformat=unix
set backspace=2               " regle le comportement de backspace
set mouse=a                   " active la souris pour toujours
set mousehide                 " hide mouse when typing
let mapleader=","             " change la touche par defaut de vim qui est \
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

nmap <Leader>ev :e $MYVIMRC   " Modifier le vimrc
" When vimrc is edited, reload it
"autocmd! bufwritepost ~/.vimrc source $MYVIMRC
"}}}
""Interface""{{{
set number                    " voir les lignes par defaut
set numberwidth=1             " 1 ligne = 1 numero
set shortmess=aTi             " format of messages (avoids 'hit editednter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility"
set showmode                  " montre le mode dans lequel je suis
set showcmd                   " voir les touches tapées
set wildmenu                  " menu en carré
set wim=list:longest,full     " la tronche des possibilité de completion
set wildignore=*.o,*.bak,*.pyc,*.swp,*.jpg,*.gif,*.png
set visualbell t_vb=          " pas de clignotement
set noerrorbells              " pas de clignotement quand erreur
set guicursor=a:blinkon0      " pas de curseur qui clignote
set laststatus=2              " toujours voir la barre de status
set stl=%f\ %m\ %r\ Buf:\ #%n\ [%b][0x%B]
set statusline+=\ [%{getcwd()}] " current directory
set stl+=\ %{fugitive#statusline()}
set stl+=\ %{Tlist_Get_Tagname_By_Line()}
set statusline+=%=%-14.(%l/%L,%c%V%)\ %p%% " Right aligned file nav info"
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
""}}}
""Couleurs""{{{
syntax on               " activer les couleurs
" colorise au lancement du fichier
" plus long mais meilleur rendu
syntax sync fromstart
autocmd BufEnter * :syntax sync fromstart

" Réglages pour le php
let php_sql_query = 1
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
set expandtab           " insert des espaces au lieu de tab
set tabstop=4           " nombre d'éspaces par tab
set softtabstop=4       " nombre d'espace pour une tab en mode edition
set shiftwidth=4        " pareil mais pour >> <<
set shiftround          " tab toujours multiple de shiftwidth
" Supprime automatiquement les espaces de fin de ligne
autocmd BufWritePre * :%s/\s\+$//e "}}}
""Édition""{{{
set nocursorline        " ne montre pas la ligne courante
set nostartofline       " conserve la colonne
set showmatch           " affiche les paires de parenthèses (),{},[]
set matchtime=3         " durée de cette affichage
let g:loaded_matchparen=1 " desactive le surlignage des paires de paranthese
set scrolloff=10        " laisser des lignes en dessus et dessous"
set nowrap              " pas de retour a la ligne par defaut
set linebreak           " Coupe pas les mots au warp
set selection=inclusive " comportement de la selection
set ofu=syntaxcomplete#Complete

"orthographe"{{{
" mapping français
map <silent> <F2> "<Esc>:silent setlocal spell! spelllang=fr<CR>"
" pas de correction orthographique par défaut
set nospell
map <leader>fn ]s
map <leader>fp [s"}}}

" saute a la derniere position du curseur"{{{
if has("autocmd")
    autocmd BufReadPost * if line("'\"")>0 && line("'\"")<=line("$")|exe "normal g`\""|endif
    autocmd BufRead *.txt set wm=1 " limit width to n cols for txt files
endif"}}}

ret diffopt=filler,iwhite,vertical  " Options pour le mode diff
map <leader>bda :1,300 bd!<cr> " Close all the buffers
" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>
" Use Q for formatting the current paragraph (or visual selection)
vmap Q gq
nmap Q gqap
" Utiliser p en mode visuel pour remplacer le texte selectionne par le text
" yanker precedement
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>
"simple matching pairs easily, with Tab
nnoremap <Tab> %
vnoremap <Tab> %
imap jj <Esc> " Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
" Permet de voir les espaces et tab en trop
set nolist
set listchars:tab:▸\ ,trail:✖
" permet de pouvoir enregistrer sans taper sudo
cmap w!! w !sudo tee % > /dev/null
"}}}
""Replis""{{{
set foldenable          " ferme les replis existant par defaut
set foldmethod=marker   " c'est les markeurs qui délimite les replis
set foldminlines=2      " nombre de ligne mini pour replis
set fillchars=fold:·    " affiche des ..... apres le nom du replis
" Ces commandes ouvre les replis
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo"
set foldcolumn=0        " pas de marge a gauche pour les replis
" Récupére la sélection après une indentation shift
vnoremap <silent> < <gv
vnoremap <silent> > >gv
"}}}
""Recherche""{{{
set hlsearch            " surligne les recherches
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " uppercase causes case-sensitive search
set wrapscan            " la recherche reprend au depart
" Enleve le surlignage apres une recherche
:noremap <silent> <Space> :silent noh<Bar>echo<CR>
" Mode magic pour les expressions regulieres
set magic"}}}
""Buffer/Fenêtres/Tabs""{{{
set hidden          " Pour pouvoir changer de buffer sans sauvegarder
set wmh=0           " Nombre minimal de lignes pour une fenêtre
" Navigation des fenetres facile
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
set splitbelow          " ouvre un nouveau fichier en dessous du précédent
nmap  ,cd :lcd %:h<cr>  "cd to the directory containing the file in the buffer
" Vertical and horizontal split then hop to a new buffer
"noremap <Leader>v :vsp^M^W^W<cr>
"noremap <Leader>h :sp^M^W^W<cr>
"}}}
""Fichier/Backup""{{{
set autoread        " recharge auto quand un fichier est modifié
set autowrite       " sauvegarde auto quand on quitte ou qu'on change de buffer
set backup          " sauvegarde
set writebackup      " ecrit le backup avant d'écrire le vrai fichier
set backupdir=$HOME/.savefile " dossier des .backup
set directory=$HOME/.swap " dossier des .swp"}}}
""Plugins""{{{
" indent-guides plugin
let g:indent_guides_enable_on_vim_startup=1 " active les guides au démarrage
let g:indent_guides_start_level=2 " active a partir du deuxième niveau
let g:indent_guides_guide_size=1 " largeur de 1 caractère
"let g:indent_guides_auto_colors = 0 " désactive les couleurs automatique du thème
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#202020   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#202020   ctermbg=4

"" MiniBufExp plugin
"let g:miniBufExplorerMoreThanOne = 2
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplSplitBelow=0

" PIV plugin
"let g:DisableAutoPHPFolding = 0

" SuperTab plugin
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" Plugin VB.NET highlighting
autocmd BufNewFile,BufRead *.vb set ft=vbnet

" Plugin Indent-guides
nnoremap <silent> <F8> :IndentGuidesToggle<CR>

"" Plugin MiniBufExp
"nnoremap <silent> <F9> :TMiniBufExplorer<CR>

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

"" Plugin Command-t
"let g:CommandTSearchPath = /Users/fl4t/

" Plugin MRU
noremap <silent> <Leader>m :MRU<cr>

"}}}

"hexhighlight
source ~/.vim/plugins/hexHighlight.vim
if exists('*HexHighlight()')
  nmap <leader>h :call HexHighlight()<Return>
endif
