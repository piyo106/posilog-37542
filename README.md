# アプリケーション名
PosiLog

# アプリケーション概要
目標を設定し、その目標を達成するまでの過程を記録することで、現状の把握や、思考の整理を助けることができる。

# URL
https://posilog-37542.herokuapp.com/

# テスト用アカウント
- Basic認証ID　　　　：admin
- Basic認証パスワード：1234

# 利用方法
## 目標設定
1. トップページ（目標一覧ページ）のヘッダーの「目標を宣言する」ボタンからフォーム入力ページへ遷移する
2. フォームの内容（目標、目的、タグ）を入力し「宣言！」ボタンで送信する
3. トップページに入力した目標が表示される

## OODA記録
1. トップページの目標を選ぶと詳細が表示される
2. 詳細ページの下部にあるフォームからOODA項目を選び、内容を入力し、「記録する」ボタンで送信する
3. 詳細ページでOODA記録の一覧が表示される

# アプリケーションを作成した背景
プログラミング学習中、エラーがなかなか解消されず行き詰まった時にモチベーションの低下を実感。浮上するまでに自分の中で色々な思考やその思考の切り替えなどがあった。この経験を通じて、自分の思考の整理ができるようなアプリケーションがあれば、もっとスムーズにモチベーションの上昇に繋げることができるのではないかと仮説を立てた。

意思決定プロセスの一つにOODA（ウーダ）ループというものがある。このOODAループを基に記録をつけることができるアプリケーションを開発することにした。

# 洗い出した要件
[PosiLog要件定義 -Googleスプレッドシート-](https://docs.google.com/spreadsheets/d/1u2AfiK80okOdCMyYK83T_ZaS5AdI5MpfXlbUsZvEuf4/edit#gid=914531170)
# 実装した機能についての画像やGIF
## トップページ
[![Image from Gyazo](https://i.gyazo.com/6763533c2a0d8b455ea83ea3fb6c8bc1.png)](https://gyazo.com/6763533c2a0d8b455ea83ea3fb6c8bc1)

## 目標宣言機能
[![Image from Gyazo](https://i.gyazo.com/c238af4d7a03f3590e5f1f781e04a593.gif)](https://gyazo.com/c238af4d7a03f3590e5f1f781e04a593)

## OODA記録機能
[![Image from Gyazo](https://i.gyazo.com/6f51ea1491ad748b85de64bfb40d7da1.gif)](https://gyazo.com/6f51ea1491ad748b85de64bfb40d7da1)
# 実装予定の機能
- 目標検索機能
- 非同期処理を用いたOODA記録内容編集機能
- フロント部分の改良
# データベース設計
[![Image from Gyazo](https://i.gyazo.com/04af9bfe26126e2cce28a916aec3b437.png)](https://gyazo.com/04af9bfe26126e2cce28a916aec3b437)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/c9f4dd3e318568d3c7830d88e6e46a2d.png)](https://gyazo.com/c9f4dd3e318568d3c7830d88e6e46a2d)
# 開発環境
- フロントエンド　：HTML, SCSS（CSS）
- バックエンド　　；Rails 6.0.5 
- インフラ　　　　：Heroku
- テスト　　　　　：RSpec
- テキストエディタ：Visual Studio Code
- タスク管理　　　：GitHub
# ローカルでの動作方法
```bash
% git clone https://github.com/piyo106/posilog-37542.git
% cd posilog-37542
% bundle install
% yarn install
```
# 工夫したポイント
- 開発する際にGitHubのIssueやProjectを利用し、タスク管理を徹底し、開発状況を自分で把握しながら実装した。

- OODAループの思考法を用いた目標管理アプリをシンプルな使用感で実現できるように意識した。

- フロントは色の統一を意識し、シンプルながら温かみのあるデザインになるようにした。
