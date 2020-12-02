import os
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.command_client import CommandClient

mod = "mod1"
mod2 = "mod4"
terminal = guess_terminal()

colors = {
    "red": "FF0000",
    "green": "#079822",
    "blue": "215578",
    "lightGrey": "#585858",
    "medGrey": "#1C1C1C",
    "darkGrey": "#121212",
    "white": "#D0D0D0",
    "orange": "#fc9003",
    "yellow": "#fffb00",
    "lightPurple": "#AF87D7",
    "neonBlue": "#5FD7FF",
    "neonGreen": "#AED500",
    "neonPurple": "#a103fc",
    "neonPink": "#FF5FAF",
    "lightYellow": "#FFFF70",
    "yellowGreen": "#cafc03",
    "gold": "#D7AF00",
    "black": "000000",
    "draculaBG": "#282a36",
    "draculaCurrentLine": "#44475a",
    "draculaFG": "#f8f8f2",
    "draculaComment": "#6272a4",
    "draculaCyan": "#8be9fd",
    "draculaGreen": "#50fa7b",
    "draculaOrange": "#ffb86c",
    "draculaPink": "ff79c6",
    "draculaPurple": "#bd93f9",
    "draculaRed": "ff5555",
    "draculaYellow": "#f1fa8c"
}

colors["main"] = colors["draculaPurple"]

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),


    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    # Switch to a certain layout directly
    Key([mod], '1', lazy.group.setlayout('max')),
    Key([mod], '2', lazy.group.setlayout('monadtall')),
    Key([mod], '3', lazy.group.setlayout('monadwide')),
    Key([mod], '4', lazy.group.setlayout('stack')),
    Key([mod], '5', lazy.group.setlayout('ratiotile')),

    # Close a window
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    # Power Management Keybindings
    Key([mod2], "l", lazy.spawn('betterlockscreen --lock blur')),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Run Command Keybindings
    Key([mod], "space", lazy.spawn('dmenu_run -b -i -dim 0.75 -h 30 -p ">" -fn "Jetbrains Mono" -nb ' + colors["draculaBG"] + ' -nf ' + colors["draculaComment"] + ' -sb ' + colors["main"] + ' -sf ' + colors["draculaBG"])),
    Key([mod], 'Return', lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], 'u', lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], 'i', lazy.spawn('alacritty -e sh -c "sleep 0.1 && nvim /home/jdv"'), desc="Launch editor"),
    Key([mod], 'o', lazy.spawn('firefox'), desc="Launch browser"),
    Key([mod], 'p', lazy.spawn('pcmanfm'), desc="Launch file manager")

]

#  groups = [Group(i) for i in "asdfuiop"]
groups = [
    Group("a", spawn="alacritty", layout="MonadTall", init=True, position=1, label="a:term1"),
    Group("s", layout="max", init=True, position=2, label="s:editor"),
    Group("d", layout="max", init=True, position=3, label="d:www"),
    Group("f", init=True, position=4, label="f:files"),
    Group("z", init=True, position=5, label="z:term2"),
    Group("x", init=True, position=6, label="x:term3"),
    Group("c", init=True, position=7, label="c:vscode"),
    Group("v", init=True, position=8, label="v:music")
]


for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        #  Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            #  desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
           desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.Max(),
    layout.MonadTall(margin = 6, border_focus = colors["draculaPink"], border_width = 2),
    layout.MonadWide(margin = 6, border_focus = colors["draculaPink"], border_width = 2),
    layout.Stack(num_stacks=2, margin = 6, border_focus = colors["draculaFG"], border_width = 2),
    layout.RatioTile(margin = 3, border_focus = colors["draculaPink"], border_width = 2),
    #  layout.Tile(margin = 6),
    # Try more layouts by unleashing below layouts.
    #  layout.Columns(border_focus_stack='#d75f5f'),
    # layout.Bsp(),
    #  layout.Matrix(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='JetBrainsMono Nerd Font Medium',
    fontsize=14,
    padding=3,
    background=colors["draculaBG"]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(custom_icon_paths=["/home/jdv/github.com/jdvober/dotfiles/.config/qtile/icons/"]),
                widget.Spacer(length=4),
                widget.GroupBox(disable_drag=True,
                                rounded=False,
                                this_current_screen_border=colors["main"],
                                this_screen_border=colors["draculaCurrentLine"],
                                other_current_screen_border=colors["main"],
                                other_screen_border=colors["draculaCurrentLine"]
                                ),
                #  widget.Spacer(length=350),
                widget.Spacer(length=bar.STRETCH),
                widget.Clock(format='[%m-%d-%Y] %I:%M %p'),
                #  widget.TaskList(rounded=False,border=colors["main"], urgent_border=colors["red"], max_title_width=120),
                #  widget.Systray(),
                #  widget.Sep(padding=8, linewidth=2, size_percent=65),
                #  widget.CheckUpdates(colour_have_updates=colors["red"], colour_no_update=colors["main"], no_update_string="yay", display_format="yay:{updates}"),
                #  widget.Sep(padding=8, linewidth=2, size_percent=65),
                #  widget.CPU(format="CPU:{load_percent}%"),
                #  widget.CPU(format=" {load_percent}%"),
                #  widget.Sep(padding=8, linewidth=2, size_percent=65),
                #  widget.Image(filename="/usr/share/icons/korla/panel/icons/16/indicator-sensors-memory.png"),
                #  widget.Memory(format="MEM:{MemPercent}%"),
                #  widget.Sep(padding=8, linewidth=2, size_percent=65),
                #  widget.Net(format="{down} ↓↑ {up}"),
                #  widget.Sep(padding=8, linewidth=2, size_percent=65),
                #  widget.TextBox(fmt="VOL:", padding=0),
                #  widget.Volume(volume_app="amixer", volume_down_command="amixer set Master 2%-", volume_up_command="amixer set Master 2%+", mute_command="amixer set Master toggle", update_interval=0.2),
            ],
            24,background=colors["medGrey"], opacity=0.85, margin=6
        ),
    ),
Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(custom_icon_paths=["/home/jdv/github.com/jdvober/dotfiles/.config/qtile/icons/"]),
                widget.Spacer(length=bar.STRETCH),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper()
                ),
                widget.Systray(),
                widget.Sep(padding=8, linewidth=2, size_percent=65),
                widget.CheckUpdates(colour_have_updates=colors["neonGreen"], colour_no_update=colors["red"], no_update_string="yay", display_format="yay: {updates}"),
                widget.Sep(padding=8, linewidth=2, size_percent=65),
                widget.CPU(format="CPU:{load_percent}%"),
                #  widget.CPU(format=" {load_percent}%"),
                widget.Sep(padding=8, linewidth=2, size_percent=65),
                #  widget.Image(filename="/usr/share/icons/korla/panel/icons/16/indicator-sensors-memory.png"),
                widget.Memory(format="MEM:{MemPercent}%"),
                widget.Sep(padding=8, linewidth=2, size_percent=65),
                widget.Net(format="{down} ↓↑ {up}"),
                widget.Sep(padding=8, linewidth=2, size_percent=65),
                widget.TextBox(fmt="VOL:", padding=0),
                widget.Volume(volume_app="amixer", volume_down_command="amixer set Master 2%-", volume_up_command="amixer set Master 2%+", mute_command="amixer set Master toggle", update_interval=0.2),
                widget.Sep(padding=8, linewidth=2, size_percent=65),
            ],
            24,background=colors["medGrey"], opacity=0.85, margin=6
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    Match(wm_type='utility'),
    Match(wm_type='notification'),
    Match(wm_type='toolbar'),
    Match(wm_type='splash'),
    Match(wm_type='dialog'),
    Match(wm_class='file_progress'),
    Match(wm_class='confirm'),
    Match(wm_class='dialog'),
    Match(wm_class='download'),
    Match(wm_class='error'),
    Match(wm_class='notification'),
    Match(wm_class='splash'),
    Match(wm_class='toolbar'),
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/github.com/jdvober/dotfiles/.config/qtile/autostart.sh')
    subprocess.call([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
