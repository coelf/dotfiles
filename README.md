# dotfiles based on stow package

based on Grafikart/dotfiles

## prerequisite

yaourt
stow


## install package
```
cat package.list | xargs yaourt -S --needed --noconfirm
```


### instal i3 config
```
make i3
```
### instal xfce4 config
```
make xfce4
```