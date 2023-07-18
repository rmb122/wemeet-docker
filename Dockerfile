FROM archlinux:latest

RUN echo 'Server = https://mirrors.bfsu.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist

RUN pacman --noconfirm -Sy archlinux-keyring && \
    pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman -Su --noconfirm && \
    pacman -S --noconfirm pkgconf vim xorg adobe-source-han-sans-cn-fonts git fakeroot binutils alsa-lib pulseaudio fcitx5-gtk qt5-webengine qt5-x11extras patchelf base-devel && \
    pacman -Scc --noconfirm

ARG USER_ID
RUN env && useradd -m user -u ${USER_ID}

USER user
RUN cd && \
    git clone https://aur.archlinux.org/wemeet-bin.git --depth=1 && \
    cd wemeet-bin && \
    makepkg

USER root
RUN pacman --noconfirm -U /home/user/wemeet-bin/wemeet-bin-*.pkg.tar.zst

USER user
RUN rm -rf ~/wemeet-bin
