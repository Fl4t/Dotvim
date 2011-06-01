" pas de scrollbars, pas de menu et autre truc moche et inutile
set guioptions=ac

" police
set guifont=Envy\ Code\ R:h13

" Lignes et colones au maximum a l'ouverture
set lines=999
set columns=999

" surligne la ligne courante
set cursorline

" warez mon colorscheme
colorscheme warez
set fuoptions=maxvert,maxhorz " fullscreen options (MacVim), redimensionne vim au maximum quand j'enleve le mode plein ecran

" fullscreen au lancement
au GUIEnter * set fullscreen
" pas de clignotement etc
au GUIEnter * set vb t_vb=
