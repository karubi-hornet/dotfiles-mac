Dotfiles for Mac
====

Thanks https://github.com/takameron/dotfiles-mac

## 実行されること
* homebrewを用いたパッケージのインストール
* asdfを用いたCLIツールのインストール
* macOSの設定
* Git・Vim・VS Code・Zshの設定

## 動作確認環境
* macOS Monterey 12.3

## 事前準備
1. このリポジトリをclone

## 使い方
1. `dotfiles-mac`ディレクトリに移動
    ```
    cd dotfiles-mac
    ```

2. ディレクトリ直下で`make`を実行すると、、セットアップが実行される。
    ```
    make
    ```

## 実行後
* 各アプリケーションにログイン
* SSH・GPGを使えるようにする
* Git
    - **ユーザー名・メールアドレスを変更**
    - GPGの設定

## License
These codes are licensed under CC0.

[![CC0](https://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](https://creativecommons.org/publicdomain/zero/1.0/deed.ja)