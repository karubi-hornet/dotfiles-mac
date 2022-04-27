#!/bin/sh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# ====================
#
# Base
#
# ====================
# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# ====================
#
# Finder
#
# ====================
# Disable animation
defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show files with all extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display the status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Display the path bar
defaults write com.apple.finder ShowPathbar -bool true

# ドライブをデスクトップに表示
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
killall Finder

# ネットワークストレージに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# USBメモリに .DS_Store ファイルを作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# --- Security ---
# ファイアーウォールをオン
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

# ====================
#
# Dock
#
# ====================

# “自動的に非表示”をオン
defaults write com.apple.dock autohide -bool true
# 最近使ったアプリケーションを非表示
defaults write com.apple.dock show-recents -bool false

# Disable animation at application launch
defaults write com.apple.dock launchanim -bool false

killall Dock

# --- SystemUIServer ---
# Display date, day, and time in the menu bar
defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d HH:mm:ss'
# Display battery level in the menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# スクリーンショットのドロップシャドウを付けない
defaults write com.apple.screencapture disable-shadow -bool true
killall SystemUIServer

# --- Safari ---
# アドレスバーに完全な URL を表示
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# ファイルのダウンロード後に自動でファイルを開くのを無効化
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# メニューバーに「開発」を表示
defaults write com.apple.Safari IncludeDevelopMenu -bool true
# デバッグメニューをオン
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# ステータスバーを表示
defaults write com.apple.Safari ShowStatusBar -bool true
killall Safari

# ---　TextEdit　---
# リッチテキストから標準テキストに変更
defaults write com.apple.TextEdit RichText -int 0

echo "👍 MacOS setting is done!"