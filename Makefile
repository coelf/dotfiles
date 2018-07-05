.PHONY: i3 xfce install installdev installi3

stow = cd config && stow -v -t ~

install:
	xargs -d '\n' -a packages/package.list yay --noconfirm --needed -S

installi3: install
	xargs -d '\n' -a packages/i3.list yay --noconfirm --needed -S

installdev: install
	xargs -d '\n' -a packages/dev.list yay --noconfirm --needed -S

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
