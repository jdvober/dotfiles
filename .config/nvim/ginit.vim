if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', 'Jetbrains Mono 12')
    call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 1)
    " NVIM_GTK_NO_HEADERBAR=1
    " NVIM_GTK_PREFER_DARK_THEME=1
    " NVIM_GTK_NO_WINDOW_DECORATION=1
endif
