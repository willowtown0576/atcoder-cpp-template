# AtCoder C++ 競プロ環境

このリポジトリは、AtCoder用C++競技プログラミング環境です。

- 開発環境は Dev Container（Docker）上で完結
- Dockerfile に必要ツールをすべて含める
- ユーザはroot
- `acc new`直後に、問題ディレクトリでそのまま make が使える

---

## 前提条件（ホストOS側）

- Docker Desktop
- VSCode/Zed（Dev Container対応エディタ）

---

## 使い方（初回）

1. VSCode/Zedでこのリポジトリを開き、Dev Containerとして起動

2. AtCoder ログイン（最初の1回だけ）

```bash
make login
```

`aclogin`が実行されるので、案内に従ってブラウザでAtCoderにログイン → Cookieコピー → ターミナルへ貼り付け を行う。

> [!NOTE]
> acc login は現在うまく動かないため使用しない。

---

## コンテスト参加手順

1. コンテスト雛形作成（例：ABC350）

```bash
make new CONTEST=abc350
```

contests/abc350/ 配下に a,b,c,... が作成される。

2. 問題ディレクトリへ移動（例：A問題）

```bash
cd contests/abc350/a
```

3. Main.cpp を編集

4. ビルド

```bash
make build
```

5. サンプルテスト

```bash
make test
```

6. 提出

```bash
make submit
```

> [!NOTE]
> 現状はリアルタイムコンテスト時以外は使用不可

---

## よく使うコマンド

- make build : コンパイル
- make test : サンプルテスト実行（oj）
- make submit : 提出（acc）
- make clean : 実行ファイル削除

---

## ルートディレクトリから特定問題を操作したい場合

- make build-in DIR=contests/abc350/a
- make test-in DIR=contests/abc350/a
- make submit-in DIR=contests/abc350/a

---

## メモ

- `acc new`で生成される各問題ディレクトリには、/workspace/Makefileへのsymlink（Makefile）が自動作成される。そのため、問題ディレクトリでそのまま`make`が使える。
