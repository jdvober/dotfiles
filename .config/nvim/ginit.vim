if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', 'Jetbrains Mono 14')
    call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 0)
    call rpcnotify(1, 'Gui', 'Option', 'Popmenu', 0)
    set guicursor=
endif
