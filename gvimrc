if has("macunix")
  " pas de scrollbars, pas de menu et autre truc moche et inutile
  set guioptions=ac
  set guifont=Monaco\ for\ Powerline:h12
elseif has("unix")
  set guioptions=aciM
  set guifont=Monaco\ 8
endif

" En dark pour faire la différence entre le terminal et macvim
set bg=dark
set fuoptions=maxvert,maxhorz " fullscreen options (MacVim), redimensionne vim au maximum quand j'enleve le mode plein ecran

" fullscreen au lancement
au GUIEnter * set fullscreen

" pas de clignotement etc
au GUIEnter * set vb t_vb=
