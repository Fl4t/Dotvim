" ---General--------------------------------------------------
" Pathogen 2.0"{{{
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect() " Activer pathogen
Helptags               " Sourcing help file
filetype plugin indent on
set nocompatible       " leave the old ways behind...
"}}}
"Couleurs"{{{
syntax on               " activer les couleurs
colorscheme solarized   " colorscheme
set bg=dark             " version sombre de solarized
"}}}
" ---$PAGER----------------------------------------------------
" Vimpager{{{
if &readonly
  set laststatus=0
  set ruler
  set cmdheight=1
  set nonumber
  set noloadplugins
  "}}}
  " ---$EDITOR---------------------------------------------------
  "General"{{{
else
  set complete=.,w,b,t   " paramètre de complétion
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
  set scrolloff=999                   " laisser des lignes en dessus et dessous"
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

  " Display-wise up/down movement instead of linewise.
  noremap j gj
  noremap k gk

  " Permet de placer au milieu de l'écran l'occurence de la recherche
  nnoremap n nzzzv
  nnoremap N Nzzzv

  " Permet d'aller au debut et a la fin d'une ligne plus facilement
  noremap H ^
  noremap L g_

  " Focus le replis ou je suis"
  nnoremap <leader>z zMzvzz

  " fix this shit
  nnoremap q: :q

  " Aller au dossier du fichier courant
  nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

  " Mapping pour éditer le vimrc et le sourcer
  nmap <silent> <leader>ev :vsplit $MYVIMRC<CR> " Modifier le vimrc
  nmap <silent> <leader>sv :so $MYVIMRC<CR> " Sourcer le vimrc

  " faute suivante/précédente
  map <leader>fn ]s
  map <leader>fp [s

  " Use the arrows to something usefull
  map <right> :bn<cr>
  map <left> :bp<cr>

  " Use Q for formatting the current paragraph (or visual selection)
  vmap Q gq
  nmap Q gqap

  " contraire de [J]oin
  nnoremap S i<cr><esc><right>

  " Completion de fichiers
  inoremap <c-f> <c-x><c-f>

  " Completion de lignes
  inoremap <c-l> <c-x><c-l>

  " Utiliser p en mode visuel pour remplacer le texte sélectionne par le texte
  " yanker précédemment
  vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

  "simple matching pairs easily, with Tab
  nnoremap <Tab> %
  vnoremap <Tab> %

  " awesome, inserts new line without going into insert mode
  map <S-Enter> O<ESC>
  map <Enter> o<ESC>

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

  " Diff.
  nnoremap <silent><Leader>do :diffoff!<CR>
  nnoremap <silent><Leader>dg :diffget<CR>:diffupdate<CR>
  nnoremap <silent><Leader>dp :diffput<CR>:diffupdate<CR>
  nnoremap <silent><Leader>du :diffupdate<CR>

  " CtrlP
  nnoremap <leader>b :CtrlPBuffer<CR>
  nnoremap <leader>m :CtrlPMRU<CR>
  nnoremap <leader>t :CtrlP<CR>

  " F1 - F12"{{{
  " mapping français
  map <silent> <F2> "<Esc>:silent setlocal spell! spelllang=fr<CR>"

  " Toggle relative/absolute numbering
  nnoremap <F3> :call NumberToggle()<CR>

  " Plugin Gundo
  nnoremap <silent> <F9> :GundoToggle<CR>

  " Voir les espaces/tab en trop
  nnoremap <F10> :set nolist!<CR>

  " Plugin NERD Tree
  nnoremap <silent> <F11> :NERDTreeToggle<CR>

  " Plugin Tagbar
  nnoremap <silent> <F12> :TagbarToggle<CR>"}}}
  "}}}
  " autoCommand"{{{
  if has("autocmd")
    " Plugin VB.NET highlighting
    au BufNewFile,BufRead *.vb set ft=vbnet

    " Moteur de template twig
    au BufNewFile,BufRead *.twig set ft=htmldjango

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
  set autowriteall " sauvegarde auto quand on quitte ou qu'on change de buffer
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

  " Plugin Tagbar
  let g:tagbar_width = 31 " like NERDTree
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

    " Activer la correction dans les fichier tex
    setlocal spell spelllang=fr

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
endif
"}}}
" Custom Functions"{{{

" Toggle relative/absolute numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
"}}}
