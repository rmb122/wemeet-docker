# wemeet-docker

容器化的腾讯会议 (wemeet).  

## 运行

```
# 生成构建镜像需要的环境变量
./init.sh

# 启动容器, 会自动打开 wemeet
docker-compose up -d
```

需要注意的是依赖 pulseaudio, 因此你可能需要在宿主机上安装 pulseaudio 或者兼容层 (例如: pipewire-pulse)  
如果无法捕捉声音, 可以打开共享电脑声音 -> 输入设备选择 WM_Loopback -> 录音设备选择要用的麦克风设备

## i3 规则

```
for_window [class="wemeetapp"] floating enable
```

## 免责提示

由于 X Server 的特殊性, 即使使用 Docker 也不能做到完全阻止所有攻击面. 虽然概率极低, 但是攻击者 (e.g. 腾讯), 完全可以在容器内达到类似[按键记录器](https://wiki.archlinux.org/title/Bubblewrap#Using_X11:~:text=While%20bwrap%20provides,a%20wayland%20compositor.)的效果. 因此如果你对腾讯非常介意, 请勿使用本项目, 可以选择使用虚拟机启动 QQ. 另外, 也不要在容器内运行任何不信任的代码.
