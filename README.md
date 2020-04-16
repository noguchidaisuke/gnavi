
# Guchi Navi
 
## アプリケーション概要

ぐるなびAPIを使った口コミ投稿サイト。
 
## 機能
 
- ぐるなびAPIを使った検索機能
- 現在地から検索
- 地名から検索
![gnavi_search](https://user-images.githubusercontent.com/37904275/79435031-2363e900-800a-11ea-8716-743634d4cc15.gif)
- コメント投稿
- 星で評価
![gnavi_review](https://user-images.githubusercontent.com/37904275/79436199-86a24b00-800b-11ea-8280-10f28f9d12c1.gif)
- ユーザー登録
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
 
 
 
