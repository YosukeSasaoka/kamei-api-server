# 目標スケジュール
- [ ] ユーザーの現在位置の参照機能(1/24)
  - [ ] [#3 位置情報をデータベースに保存する](https://github.com/YosukeSasaoka/kamei-api-server/issues/3)
  - [ ] [#7 位置情報の更新通知](https://github.com/YosukeSasaoka/kamei-api-server/issues/7)
    - [ ] [#5 位置情報更新の監視](https://github.com/YosukeSasaoka/kamei-api-server/issues/5)
    - [ ] [#6 偽装位置情報の表示(開始・終了)時刻の監視](https://github.com/YosukeSasaoka/kamei-api-server/issues/6)
  - [ ] [#8 位置情報の抽出と応答](https://github.com/YosukeSasaoka/kamei-api-server/issues/8)
- [ ] 偽装行動設定機能(2/11)
  - [ ] [#9 偽装行動年月日一覧・削除](https://github.com/YosukeSasaoka/kamei-api-server/issues/9)
  - [ ] [#10 偽装行動 一覧・削除](https://github.com/YosukeSasaoka/kamei-api-server/issues/10)
  - [ ] [#11 偽装対象のユーザーのリストを提供する](https://github.com/YosukeSasaoka/kamei-api-server/issues/11)
  - [ ] [#12 偽装情報の登録APIを提供する](https://github.com/YosukeSasaoka/kamei-api-server/issues/12)
  - [ ] [#13 偽装情報の更新APIを提供する](https://github.com/YosukeSasaoka/kamei-api-server/issues/13)
- [ ] 一般ユーザー接近検知機能(2/17)
  - [ ] [#14 位置情報からユーザー間の距離を算出](https://github.com/YosukeSasaoka/kamei-api-server/issues/14)
  - [ ] [#15 一般ユーザーの接近通知を送信する](https://github.com/YosukeSasaoka/kamei-api-server/issues/15)
- [ ] 偽装発覚機能(2/24)
  - [ ] [#16 一般ユーザーが登録してからの日数を算出する](https://github.com/YosukeSasaoka/kamei-api-server/issues/16)
  - [ ] [#17 偽装見破り通知を送信する](https://github.com/YosukeSasaoka/kamei-api-server/issues/17)
  - [ ] [#18 偽装見破り通知を送信する](https://github.com/YosukeSasaoka/kamei-api-server/issues/18)
- [ ] ユーザー登録機能(2/26)
  - [ ] [#19 ユーザー登録APIを提供する](https://github.com/YosukeSasaoka/kamei-api-server/issues/19)

# 土佐ビジネスアカデミー Nextremer API Server

位置情報アプリのサービス用Web APIを提供するための、Ruby on Rails製のアプリケーション。

# 開発手順 : Get Started

## Requirements

* ruby 2.2系 (2.2.4)
* bundler (ruby install時に自動でインストールされる)

## セットアップ
rbenvを使っている場合

下記のコマンド等でインストールしておくと良いと思います。

```
rbenv install 2.2.4
```

```bash
# Clone
git clone git@github.com:YosukeSasaoka/tba-app-api.git
cd tba-app-api
# bundleをインストール
gem install bundler
# 依存ライブラリインストール
# もしかしたら bundle update を実行しろと言われるかもしれません
bundle install --path vendor/bundle
# サーバ起動（ポートは3002
bundle exec rails s -p 3002
# ブラウザでアクセス
http://localhost:3002/
# ↓が表示されれば完了
Yay! You’re on Rails!
```

# 開発ルール

* テストを書くなら壊さないでおくこと。保守できていないテストは書いてない方が良い。

# 最新の取得

```bash
git pull origin master
# 依存ライブラリが増えている場合
bundle install
# DBに追加がある場合
bundle exec rake db:migrate
# サーバ起動
bundle exec rails s
```


# その他ヒント諸々

## メインの依存ライブラリ

* [Grape](https://github.com/intridea/grape) : Ruby製のWebAPI作成フレームワーク
* [grape-swagger](https://github.com/tim-vandecasteele/grape-swagger) : Grapeベースで記述されたAPIのドキュメント自動生成ツール
* [Pry](https://github.com/rweng/pry-rails) : デバッグツール. `rails c`もパワーアップ.
    * [Pryを使ってRailsのコンソールをパワーアップ&デバッグをする](http://ruby-rails.hatenadiary.com/entry/20141024/1414081224)
* [Rails Admin](https://github.com/sferik/rails_admin) : 管理画面の動的自動生成
    * [Rails4にrails_adminを導入して綺麗な管理画面が出来るまで](http://tagamidaiki.com/introduce-rails-admin-to-rails4/)

#### DBをまっさらにしたい

```bash
bundle exec rake db:drop db:create db:migrate db:seed
```
