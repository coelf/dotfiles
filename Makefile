.PHONY: i3 xfce install installdev installi3

stow = cd config && stow -v -t ~

install:
	xargs -d '\n' -a packages/package.list yaourt --noconfirm --needed -S

installi3: install
	xargs -d '\n' -a packages/i3.list yaourt --noconfirm --needed -S

installdev: install
	xargs -d '\n' -a packages/dev.list yaourt --noconfirm --needed -S

dev:

	$(stow) git
	$(stow) vim
	$(stow) others

i3: dev
	$(stow) i3
	$(stow) polybar
	$(stow) compton
	$(stow) rofi
	xrdb ~/.Xresources

xfce: dev
	$(stow) xfce4

mousepad:
	xargs -d '\n' -a packages/mouse.list yaourt --noconfirm --needed -S
	sudo ln -sf `pwd`/etc/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d
noxbell:
	sudo ln -sf `pwd`/etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf
conf: mousepad noxbell