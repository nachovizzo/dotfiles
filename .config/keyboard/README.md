# How to fix Disable-While-Typing Issues

In Dell laptops (DELL XPS15) mainly the problem is that the keyboard is
detected as an external keyboad, and therefore the libinput library will not
pair it with the touchpad. That's why no matter what gconf , dconf, GUI, gnome
version/editor you use will have an impact. The solution is studied deeply in
[here](https://linuxtouchpad.org/libinput/2022/05/07/disable-while-typing.html).
But for the records, in my case, I'm using keyd, so it's yet another virtual
keyboard and the solution is to:

```sh
sudo mkdir -p /etc/libinput
sudo cp $HOME/.config/keyboard/local-overrides.quirks /etc/libinput/
```

## `local-overrides.quirks` content

```sh
[Serial Keyboards]
MatchUdevType=keyboard
MatchName=keyd virtual keyboard
AttrKeyboardIntegration=internal
```
