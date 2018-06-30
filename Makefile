.PHONY: i3 dev install

install:
	xargs -d '\n' -a packages/package.list yay --noconfirm --needed -S

i3: install
	xargs -d '\n' -a packages/i3.list yay --noconfirm --needed -S

dev: install
	xargs -d '\n' -a packages/dev.list yay --noconfirm --needed -S
