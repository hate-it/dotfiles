Those are my dotfiles.

```bash
pacman -S stow
for package in X bash zsh gtk-2.0 gtk-3.0 i3 polybar tig trizen vim vifm alacritty; do
    echo "stow ${package}"
    stow -v ${package}
done
```
