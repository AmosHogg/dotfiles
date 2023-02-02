# ## 简介

ranger是一个在终端中使用的文件管理器，具备搜索、查找、文件预览、文件编辑、标签页、鼠标点击等操作，大部分快捷键和vim类似。

## 安装

```bash
yay -S ranger
```

## 配置

启动之后ranger会创建一个目录`~/.config/ranger `可以使用以下命令复制默认配置文件到这个目录

```bash
ranger --copy-config=all
```

- `rc.conf`-选项设置和快捷键
- `commands.py`-能通过:执行的命令
- `commands_full.py`-全套命令
- `rifle.conf`-指定不同类型的文件的默认打开程序
- `scope.conf`-负责各种文件预览

> 注意：如果要使用~/.config/ranger目录下的配置生效，需要把RANGER_LOAD_DEFAULT_RC变量设置为false

```bash
bash
echo "export RANGER_LOAD_DEFAULT_RC=false">>~/.bashrc

zsh
echo "export RANGER_LOAD_DEFAULT_RC=false">>~/.zshrc
```



### 可选配置(推荐)

修改`.../ranger/rc.conf`

- 显示边框　set draw_borders both

- 显示序号set line_numbers true
- 序号从1开始set one_indexed true



#### 开启图片预览

set preview_images true

预览图片的方式，因为我这里使用的是iterm2所以配置iterm2，非iterm2可以选择w3m



set preview_images_method iterm2

如果开启了图片预览，建议配置预览文件最大限制，因为图片大了会导致卡顿（单位byte）我这里配置的是100KB



set preview_max_size 102400



## 使用

直接在终端输入ranger即可进入ranger模式


## 快捷键

在浏览时常用的快捷键

S   切换到ranger最后浏览的目录
zh/退回键  显示隐藏文件
H   后退
L   前进
gg  跳到顶端
G   跳到底端
gh  go home
gn  新建标签(tab键切换标签)
f   查找(如果只有一个匹配结果会直接打开该目录或文件)
/   搜索
g   快速进入目录

这些快捷键都是与vim的操作一样

yy      复制
dd      剪切
pp      粘贴
dD      删除（需要回车键确认）
cw      重命名
A       在当前名称基础上重命名
I       类似A, 但是光标会跳到起始位置
Ctrl-f  向下翻页
Ctrl-b  向上翻页

书签

m       新建书签
`       打开书签
um      删除书签

标签

gn / Ctrl-n        新建标签
TAB / Shift-TAB     切换标签
gc / Ctrl-w        关闭标签

文件排序 :

on/ob   根据文件名进行排序(natural/basename)
oc      根据改变时间进行排序 (Change Time 文件的权限组别和文件自身数据被修改的时间)
os      根据文件大小进行排序(Size)
ot      根据后缀名进行排序 (Type)

oa      根据访问时间进行排序 (Access Time 访问文件自身数据的时间)
om      根据修改进行排序 (Modify time 文件自身内容被修改的时间)

安装插件

ranger也有很多预览时用的插件

macOS
brew install libcaca highlight atool lynx w3m elinks poppler transmission mediainfo exiftool

ubuntu
sudo apt-get install caca-utils # img2txt 图片
sudo apt-get install highlight  # 代码高亮
sudo apt-get install atool　    # 存档预览
sudo apt-get install w3m        # html页面预览
sudo apt-get install mediainfo  # 多媒体文件预览
sudo apt-get install catdoc     # doc预览
sudo apt-get install docx2txt   # docx预览
sudo apt-get install xlsx2csv   # xlsx预览

最后总结一下：

- g开头主要是目录跳转，后面可以跟一些参数指定要跳转的位置
- s开头主要是排序，后面跟一些排序规则
- z开头主要是设置，后面跟一些具体要设置什么.
- 开头主要是文件过滤，后面跟一些过滤规则筛选出满足条件的文件或目录


