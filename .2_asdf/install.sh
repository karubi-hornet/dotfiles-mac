#!/bin/sh

# asdfコマンドがなければasdfをインストール
if ! (type asdf > /dev/null 2>&1); then
  if ! (type brew > /dev/null 2>&1); then
    sh homebrew/install.sh
  fi
  brew install coreutils curl git
  brew install asdf
fi

# add to shell
if ! (grep libexec/asdf.sh ~/.zshrc > /dev/null 2>&1) ; then
  echo ". $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.zshrc
fi

# Default Packages
basename -a "$PWD"/.2_asdf/.default-* | xargs -I{} ln -sfv "$PWD"/.2_asdf/{} ~/{}

# === asdf-nodejs ===
# Requirements
brew install coreutils gpg gawk
# Install plugin
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
# Import the Node.js release team's OpenPGP keys to main keyring
# bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
# Install Node.js
asdf install nodejs latest
asdf global nodejs "$(asdf list nodejs | tail -1 | sed -e 's/ //g')"

# yarn
asdf plugin add yarn
asdf install yarn latest
asdf global yarn latest
if ! (grep `yarn global bin` ~/.zshrc > /dev/null 2>&1) ; then
  echo "export PATH=$PATH:`yarn global bin`" >> ~/.zshrc
fi

# === asdf-python ===
# Install plugin
asdf plugin-add python https://github.com/danhper/asdf-python
# Install Python
asdf install python latest
asdf global python "$(asdf list python | tail -1 | sed -e 's/ //g')"

# === asdf-ruby ===
# Requirements(optional, but recommended)
if ! (brew list openssl) ; then
  if ! (brew list readline) ; then
    brew install openssl readline
    echo "export RUBY_CONFIGURE_OPTS=\"--with-openssl-dir=\"$(brew --prefix openssl@1.1)\"\"" >> ~/.zshrc
  fi
fi

# Install plugin
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
# Install Ruby
asdf install ruby latest
asdf global ruby "$(asdf list ruby | tail -1 | sed -e 's/ //g')"

# === asdf-java
# if ! (grep set-java-home.zsh ~/.zshrc > /dev/null 2>&1) ; then
#   asdf plugin-add java https://github.com/halcyon/asdf-java.git
#   asdf install java "$(asdf list java | grep -iE 'adoptopenjdk-[0-9]' | grep -v beta | tail -1)"
#   asdf global java "$(asdf list java | grep -iE 'adoptopenjdk-[0-9]' | grep -v beta | tail -1)"
#   echo ". ~/.asdf/plugins/java/set-java-home.zsh" >> ~/.zshrc
# fi

echo "👍 asdf install is done!"
