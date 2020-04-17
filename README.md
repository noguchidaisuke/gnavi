
# Guchi Navi
 
## アプリケーション概要
Railsで作ったお店の口コミ投稿サイト。
[url](https://my-gnavi-free.ga/)

## demo
![gnavi-re-sm](https://user-images.githubusercontent.com/37904275/79518961-54393200-808d-11ea-8c2b-407a59784ecc.gif)

## 機能
- 検索機能 (ぐるなびAPI)
- マップ機能 (google map API)
- コメント投稿 (Jquery)
- 星で評価 (jquery raty)
- ユーザーログイン機能
- ランキング機能
 
## テスト
使ったGem
- Rspec/FactoryBot/Capybara/VCR/mock 

内容
- 簡単なUserModelの単体テスト
- ログイン周りの統合テスト
- VCRを使ってぐるなびAPIのmockテスト
[参照文献](https://leanpub.com/everydayrailsrspec-jp)
 
## デプロイ
ECS/ELB/RDS/S3/IAM/AutoScaling

## CICD
circlCI
