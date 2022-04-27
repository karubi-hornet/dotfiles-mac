# Do everything.
all: init homebrew asdf macos vscode 

# Set initial preference.
init:
	.0_init/install.sh

# Install macOS applications.
homebrew:
	.1_homebrew/install.sh

# Install macOS applications using asdf.
asdf:
	.2_asdf/install.sh

# Set macOS system preferences.
macos:
	.3_macos/install.sh

# Link dotfiles.
dotfiles:
	.4_dotfiles/install.sh

# VSCode Settings.
vscode:
	.5_vscode/install.sh
