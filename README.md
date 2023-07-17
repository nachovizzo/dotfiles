# Nacho dotfiles

Work in progress (almost finished) transition repository using yadm as tool

## Dependencies

- `curl`
- root access, `sudo` or `root` user

## Minimal Installation

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nachovizzo/dotfiles/main/tools/install.sh)"
```

## Full Installation

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/nachovizzo/dotfiles/main/tools/install.sh)" "" --full
```
## TODO

- [ ] Install kitty terminal
- [ ] Install fonts automagicaly (with patches)
- [ ] Add CI so I can rest in peace
- [ ] Investigate the use of `stow` to have a `~/dotiles` repo I can git-use
