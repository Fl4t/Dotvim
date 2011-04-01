set guioptions-=T " pas de barre avec les icones
set guioptions-=r " pas de scrollbar a droite 
set guioptions-=l " pas de scrollbar a gauche
set guioptions-=b " pas de scrollbar en bas

"standard maximise hack
set lines=999
set columns=999

colorscheme wombat
set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen

" fullscreen au lancement
au GUIEnter * set fullscreen

" Donne le chemain pour le plugin Taglist de vim.
let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'

" Mettre la fenetre taglist a droite.
let Tlist_Use_Right_Window = 1
