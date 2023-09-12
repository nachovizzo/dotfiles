#!/bin/bash

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

install_ohmyzsh() {
  export CHSH=no
  export KEEP_ZSHRC=yes
  export RUNZSH=no
  export OHMYZSH_URL=https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master
  export ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

  # Instal oh-my-zsh always, update if already istalled
  ZSH= sh -c "$(curl -fsSL $OHMYZSH_URL/tools/install.sh)" >/dev/null || zsh -i -c "omz update"

  # If user shell is not zsh, change it (password required)
  if [ ! "$(basename "$SHELL")" = "zsh" ]; then
    RUN=$(command_exists sudo && echo "sudo" || echo "command")
    $RUN chsh -s "$(which zsh)" "$USER" 2>/dev/null || chsh -s "$(which zsh)"
  fi

  # Install zsh-autosuggestions custom plugin
  git clone --depth 1 \
    https://github.com/zsh-users/zsh-autosuggestions \
    ${ZSH_CUSTOM}/plugins/zsh-autosuggestions 2>/dev/null || true

  # Copy custom configuration to the oh my sh installation
  cp -r $HOME/.templates/oh-my-zsh-custom/* ${ZSH_CUSTOM}
}

install_neovim_extensions() {
  # Install vim-plug packages
  nvim --noplugin --headless +PlugInstall +qall

  # Manually install coc-extensions(https://github.com/neoclide/coc.nvim/issues/118)
  COC_EXTENSIONS=$(nvim --headless -c 'echo coc_global_extensions' +qa 2>&1 | awk -v RS="'" '!(NR%2)')
  COC_EXT_DIR="$HOME/.config/coc/extensions"
  mkdir -p $COC_EXT_DIR && cd $COC_EXT_DIR && [ ! -f package.json ] && echo '{"dependencies":{}}' >package.json
  npm install $(echo $COC_EXTENSIONS) --install-strategy=shallow --ignore-scripts --no-bin-links --no-package-lock --only=prod
}

install_pip_packages() {
  python3 -m pip install --upgrade -r $HOME/.config/yadm/pip_packages
}

install_brew_packages() {
  xargs brew install <$HOME/.config/yadm/brew_packages

  # Now fix some madenes, to have compatibility with system wide libraries in Ubuntu 22.04
  brew unlink python@3.11
  brew link python@3.10
  brew unlink ruby@3.2
  brew link ruby@3.0
}

# To fetch clangd in brew we need to pull the whole llvm toolchain, which brings 1.5GiB to the
# workspace, luckilly clang-format is available as standalone package
install_standalone_clangd() {
  command_exists clangd && echo "clangd already isntalled on the system: $(clangd --version)" && return

  # TODO: Automatically determine latest stable version, and don't hardcode linux
  CLANGD_VERSION="16.0.2"
  curl -LO https://github.com/clangd/clangd/releases/download/${CLANGD_VERSION}/clangd-linux-${CLANGD_VERSION}.zip
  unzip clangd-linux-${CLANGD_VERSION}.zip
  cp -R clangd_${CLANGD_VERSION}/* $HOME/usr/
  rm -rf clangd_${CLANGD_VERSION}/
  rm clangd-linux-${CLANGD_VERSION}.zip
}

install_fonts() {
  if [[ -z $(fc-list | grep SFMono) ]]; then
    echo "SFMono patched fonts not installed, this might take a bit"
    sh ~/.config/fonts/install_fonts.sh
  else
    echo "SFMono patched already installed, skipping"
  fi
}
