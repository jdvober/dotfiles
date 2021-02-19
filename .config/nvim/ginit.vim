if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', 'VictorMono Nerd Font 14')
    " call rpcnotify(1, 'Gui', 'Font', 'JetBrainsMono Nerd Font 14')
    call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
    call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 0)
    call rpcnotify(1, 'Gui', 'Option', 'Popmenu', 0)
    call rpcnotify(1, 'Gui', 'Command', 'SetCursorBlink', '0')
    set guicursor=
endif
:Guifont! VictorMono Nerd Font:h14
:GuiTabline 0
" :GuiAdaptiveColor 1
" :GuiAdaptiveFont 1
:GuiPopupmenu 1
GuiRenderLigatures 1
