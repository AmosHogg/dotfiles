# rofi

[Rofi](https://link.zhihu.com/?target=https%3A//github.com/davatorium/rofi)，类似于苹果电脑的[Spotlight Search](https://link.zhihu.com/?target=https%3A//support.apple.com/en-hk/guide/mac-help/mchlp1008/mac)。在i3wm中，Rofi可以让我们快速的打开应用程序和切换窗口。

## 安装 Install

```text
sudo pacman -S rofi
```

## 初识 Get started

安装好之后，就可以简单的用起来了。例如下面的命令，会弹出悬浮窗口，列出当前窗口列表，然后，可以检索，选择切换到不同的窗口下面。

```text
rofi -show window
```

包括窗口，rofi大多支持如下modi：

- **run**: `$PATH`下的应用程序
- **drun**: 桌面程序，一般对应目录`/usr/share/applications`下的`.desktop`文件.
- **window**: 窗口
- **ssh**: 通过ssh链接远程服务器
- **file-browser**: 简单的文件浏览器.
- **keys**: 快捷键.
- **combi**: 混合模式.

## 配置 Config

rofi提供了一些配置，如theme，icons，字体，混合模式检索范围，等等，我们可以创建`~/.config/rofi/config.rasi`设置当前用户的默认配置

```text
configuration {
 modi: "window,drun,ssh,combi";
 theme: "solarized";
 font: "hack 10";
 combi-modi: "window,drun,ssh";
 }
```

 更多配置选项可以通过执行下面的命令查看。

```text
rofi -dump-config
```

## 与i3集成

在`~/.config/i3/config`添加下面的代码。之后按快捷键`Win+d`或`Ctrl+d`就可以打开rofi了。
