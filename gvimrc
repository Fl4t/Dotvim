"set guioptions-=Trlb " pas de barre avec les icones
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
