echo "------------------------------------------------"
echo "欢迎运行kitty配置脚本"
echo "此程序会将你的配置文件储存在'kitty.bak'文件中"
echo "项目主页：https://gitlab/hoggadams/dotfiles"
echo
read -p "字体家族: " font_family
echo "font_family $font_family" >> $HOME/.config/kitty/kitty.conf
read -p "字体大小：" font_size
echo "font_size $font_size" >> $HOME/.config/kitty/kitty.conf
read -p "打开程序时配置框在桌面的横坐标(-1表示居中):" left
echo "left=$left" >> $HOEM/.config/kitty/kitty.conf
read -p "打开程序时配置框在桌面的纵坐标(-1 表示居中):" top
echo "top=$top" >> $HOME/.config/kitty/kitty.conf
read -p "使用CTRL+Tab在PuTTY窗口之间切换(Y/N)" Tab_judge
if [$Tab_judge == 'Y' || $Tab_judge == 'y'];then
	echo "ctrltab=yes" >> $HOME/.config/kitty/kitty.conf
elif [$Tab_judge == 'N' || $Tab_judge == 'n'];then
	echo "ctrltab=no" >> $HOEM/.config/kitty/kitty.conf
read -p "是否启用连接cygterm功能(Y/N):" cygterm_judge
if [$cygterm_judge == 'Y' || $cygterm_judge == 'y'];then
	echo "cygterm=yes" >> $HOEM/.config/kitty/kitty.conf
elif [$cygterm_judge == 'N' || $cygterm_judge == 'n'];then
	echo "cygterm=no" >> $HOME/.config/kitty/kitty.conf
read -p "是否启用超连接功能(Y/N):" hyperlink_judge
if [$hyperlink_judge == 'Y' || $hyperlink_judge == 'y'];then
	echo "hyperlink=yes" >> $HOME/.config/kitty/kitty.conf
elif [$hyperlink_judge == 'N' || $hyperlink_judge == 'n'];then
	echo "hyperlink=no" >> $HOME/.config/kitty/kitty.conf 
read -p "是否启用窗口标题中的窗口大小(Y/N):" size
if [$size == 'Y' || $size == 'y'];then
	echo "size=yes" >> $HOME/.config/kitty/kitty.conf
else;then
	echo "size=no" >> $HOME/.config/kitty/kitty.conf
echo "请查看themes/README.md后执行themes/theme.sh脚本"
