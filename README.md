
# Guchi Navi
 
## アプリケーション概要

ぐるなびAPIを使った口コミ投稿サイト。

***デモ***
 
![デモ](https://my-gnavi-free.ga/)
 
## 機能
 
- ユーザー登録
- コメント投稿
- 星で評価
- ぐるなびAPIを使った検索機能
- 現在地から検索
- 地名から検索
- ランキング機能

## 使い方
 
1. toppageに検索したいワード、地名を入力。現在地から検索したい場合はAreaフォームをクリックすると出現する「現在地」を押す
2. googlemapと検索結果が表示される。興味のある店をクリック
3. 詳細ページに飛ぶ。詳細ページでは、コメントの投稿、編集、削除ならびにお気に入り登録を行うことができる
4. 投稿したコメントはマイページの「投稿したお店」から参照できる。
 
## テスト
簡単なmodelの単体テスト。
capybaraによる統合テスト。
VCRを使ったぐるなびAPIのモックテスト。
 
## デプロイ
CI/CD: CircleCI
AWS: ECS
 
## 使用技術一覧
Rails / Mysql / Docker / CircleCI / Jquery / ECS /  RDS / SchemaSpy

##　外部API
Gurunavi / Twitter / GoogleMap / Stripe
 
