# rofi

[Rofi](https://github.com/DaveDavenport/rofi) 是一个窗口选择器，运行对话框，ssh启动器和 [dmenu](https://wiki.archlinuxcn.org/wiki/Dmenu) 的替代品。它最初是由[Sean Pringle](https://github.com/seanpringle)编写，并由[Dave Davenport](https://github.com/DaveDavenport)扩展的[simpleswitcher](https://github.com/seanpringle/simpleswitcher)的克隆。



## 安装

[安装](https://wiki.archlinuxcn.org/wiki/Help:Reading#安装软件包)[rofi](https://archlinux.org/packages/?name=rofi)包要在[Xorg](https://wiki.archlinuxcn.org/wiki/Xorg)显示管理器下使用。

在主分支中合并对[Wayland](https://wiki.archlinuxcn.org/wiki/Wayland)的支持已经无限期的延迟了[[1\]](https://github.com/davatorium/rofi/pull/1139)。对于[Wayland](https://wiki.archlinuxcn.org/wiki/Wayland)的支持，安装[rofi-lbonn-wayland](https://aur.archlinux.org/packages/rofi-lbonn-wayland/)AUR或开发版本的[rofi-lbonn-wayland-git](https://aur.archlinux.org/packages/rofi-lbonn-wayland-git/)AUR来代替。 请注意，这些包需要支持 Layer Shell protcol 的 Wayland 合成器。这包括基于wlroots的合成器，如Sway，以及一些基于Mir的合成器，但不包括mutter，例如Gnome的合成器。

要知道更多关于rofi的东西和它的用法，看[rofi(1)](https://man.archlinux.org/man/rofi.1)的帮助页面。

## 配置

目前有三种设置配置选项的方法：

- 本地配置。一般来说，依赖于XDG，在`~/.config/rofi/config.rasi`里。
- [Xresources](https://wiki.archlinuxcn.org/wzh/index.php?title=Xresources&action=edit&redlink=1)：一种将key value保留在Xserver中的方法。
- 命令行选项。

**注意：** Xresources方法自rofi 1.6.0起已过时，可能随时停止工作。

所以

```
$ rofi -combi-modi window,drun,ssh -theme solarized -font "hack 10" -show combi
```

可以用这样的配置文件表示（新主题格式）：

```
configuration {
 modi: "window,drun,ssh,combi";
 font: "hack 10";
 combi-modi: "window,drun,ssh";
 }
@theme "solarized"
```

为了得到完整的`config.rasi`文件的选项列表，运行`rofi -dump-config`命令来了解。您可以在运行`rofi -dump-config > ~/.config/rofi/config.rasi`时将命令的输出直接写入配置文件。

**注意：** [i3](https://wiki.archlinuxcn.org/wiki/I3) users be aware that putting commas in the *i3* configuration file can cause issues. To bind a key to launch *rofi*, either use a configuration file or replace the commas with `#`, e.g. `rofi -combi-modi window#drun#ssh`.

### 图标

可以使图标和相应的条目一起显示。假设你已经安装了[papirus-icon-theme](https://archlinux.org/packages/?name=papirus-icon-theme)包，使用`-show-icons`并使用`-icon-theme`定义图标，那么可以通过以下操作来让*rofi*显示图标：

```
$ rofi -combi-modi window,drun,ssh -theme solarized -font "hack 10" -show combi -icon-theme "Papirus" -show-icons
```

## Custom themes

You can preview and apply themes for *rofi* with

```
$ rofi-theme-selector
```

Customizations may be saved to your [.Xresources](https://wiki.archlinuxcn.org/wzh/index.php?title=.Xresources&action=edit&redlink=1) file (requires the [xorg-xrdb](https://archlinux.org/packages/?name=xorg-xrdb)包 package). To apply changes, reload `.Xresources` with `xrdb -load ~/.Xresources`.

### Contributed themes

Rofi comes with several official themes, and more user themes can be found at the [rofi-themes](https://github.com/DaveDavenport/rofi-themes) repository.

Load up an official theme, or download a *.rasi* user theme and place it in `~/.config/rofi/example.rasi` on the command line:

```
$ rofi options -theme example
```

Alternatively, in your configuration file outside of the `configuration { }` block:

```
@theme "example"
```

## Tips and tricks

### Rofi as dmenu replacement

If called as [dmenu](https://wiki.archlinuxcn.org/wiki/Dmenu) (via a symlink), *rofi* acts like *dmenu*. Then, programs that call *dmenu* from a script (like *passmenu* from [pass](https://wiki.archlinuxcn.org/wiki/Pass)) will use *rofi* instead of *dmenu*.

If you prefer the look of *dmenu*, this approximates it:

```
rofi -show run -modi run -location 1 -width 100 \
		 -l 1 -line-margin 0 -line-padding 1 \
		 -separator-style none -font "mono 10" -columns 9 -bw 0 \
		 -disable-history \
		 -hide-scrollbar \
		 -color-window "#222222, #222222, #b1b4b3" \
		 -color-normal "#222222, #b1b4b3, #222222, #005577, #b1b4b3" \
		 -color-active "#222222, #b1b4b3, #222222, #007763, #b1b4b3" \
		 -color-urgent "#222222, #b1b4b3, #222222, #77003d, #b1b4b3" \
		 -kb-row-select "Tab" -kb-row-tab ""
```

### Execute shell commands from rofi

If you want the ability to run [shell](https://wiki.archlinuxcn.org/wzh/index.php?title=Shell&action=edit&redlink=1) commands or use your own scripts directly from *rofi* with seeing the output, then ensure following:

- Define `-run-shell-command '{terminal} -e *SHELL* -ic "{cmd} && read"` where `*SHELL*` is your shell (e.g. bash, zsh). This allows you to enter the command on the inputbar followed by `Shift+Enter`. The terminal stays open until the next keypress.

This is an example with the recommended escaping sequence for *i3*:

```
bindsym $mod+d exec --no-startup-id rofi -show drun -run-shell-command '{terminal} -e zsh -ic "{cmd} && read"'
```

### Unicode selection integration

Install [rofimoji](https://archlinux.org/packages/?name=rofimoji)包 for a Unicode emoji/character picker integrated with *rofi*. See the [project's README](https://github.com/fdw/rofimoji#readme) for [usage](https://github.com/fdw/rofimoji#usage) and [configuration](https://github.com/fdw/rofimoji#configuration).

### Rofi as power management menu

Rofi can be used to perform power management operation with systemd. Clone [rofi-power-menu repository](https://github.com/jluttine/rofi-power-menu). To launch it, you have to tell rofi where to find *rofi-power-menu* executable. For example, if the executable is in $HOME/.rofi-power-menu:

```
rofi -show p -modi p:$HOME/.rofi-power-menu
```

You can also put the executable in the PATH, and pass only its name.

To show default symbols, you may need to install [ttf-nerd-fonts-symbols](https://archlinux.org/packages/?name=ttf-nerd-fonts-symbols)包[[损坏的链接](https://wiki.archlinuxcn.org/wiki/Help:Procedures#Fix_broken_package_links)：replaced by [ttf-nerd-fonts-symbols-2048-em](https://archlinux.org/packages/?name=ttf-nerd-fonts-symbols-2048-em)包].

For more information, read the README file in the repository.


