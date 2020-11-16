if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', 'Jetbrains Mono 12')
    call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 0)
    set guicursor=
endif
