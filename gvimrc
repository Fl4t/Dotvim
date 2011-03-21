"set guioptions-=Trlb " pas de barre avec les icones
set guioptions-=T " pas de barre avec les icones
set guioptions-=r " pas de scrollbar a droite 
set guioptions-=l " pas de scrollbar a gauche
set guioptions-=b " pas de scrollbar en bas
"set fullscreen    " fullscreen au lancement

"standard maximise hack
set lines=999
set columns=999

colorscheme tir_black
set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
au GUIEnter * set fullscreen
