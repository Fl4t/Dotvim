" pas de scrollbars, pas de menu et autre truc moche et inutile
set guioptions=ac

" police
set guifont=Envy\ Code\ R:h13

" Lignes et colones au maximum a l'ouverture
set lines=999
set columns=999

" il est beauuuu
colorscheme getafe
set fuoptions=maxvert,maxhorz " fullscreen options (MacVim), redimensionne vim au maximum quand j'enleve le mode plein ecran

" fullscreen au lancement
au GUIEnter * set fullscreen

" Donne le chemain pour le plugin Taglist de vim.
let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'

" Mettre la fenetre taglist a droite.
let Tlist_Use_Right_Window = 1

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$' ]
