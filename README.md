# <a href="https://www.boditore.com">Boditore</a>

![Boditore_紹介画像](https://user-images.githubusercontent.com/79243411/139571787-ddd37840-d3db-457a-aed5-f4508530edf6.gif)

## アプリの概要

本作品をご覧いただきありがとうございます。<br>
筋トレを始めた人が挫折せずに続けることを目的とした、筋トレ SNS アプリです。
筋トレ SNS である本アプリでは、筋トレをする仲間を見つけることができ、その仲間たちと情報交換ができるため横のつながりができ、挫折せずに筋トレを習慣化することができます。<br>
公式マニュアルや技術記事などを参考に、すべて独学で開発しました。<br>

サイト URL・・・<a href="https://www.boditore.com">Boditore</a>（トップページ右上からゲストログインできます。）

## 使用技術

### バックエンド

・Ruby(2.6.5)<br>
・Rails(5.2.6)<br>

### フロントエンド

・HTML/CSS<br>
・Javascript<br>
・Vue.js<br>
・TailwindCSS（UI フレームワーク）<br>

### 開発環境、インフラ

・Docker/docker-compose<br>
・MySQL(8.0.23)<br>
・CircleCI<br>
・Unicorn<br>
・Nginx<br>
・AWS(VPC、ACM、Route53、EC2、RDS、S3、IAM)<br>

### テスト、静的コード解析

・Rspec<br>
・Rubocop<br>

### その他開発中に意識した点

・擬似チーム開発を意識した点。<br>
github でプルリクを活用し、機能実装の細分化をしました。<br>
・アプリの部分 SPA 化<br>
Vue.js を使用して投稿機能を部分 SPA 化をしました。<br>
・ECS への自動デプロイ<br>
capistorano を用いて自動デプロイを実装しました。<br>

## こだわったポイント

### <strong>直感的に動かせる UI/UX</strong><br>

誰でも手軽に利用できるように、投稿一覧・ユーザー一覧・通知・ログイン関係のページへの遷移機能を
すべてヘッダーでできるようにしております。
また、トップページに Slick を利用した自動スライドアニメーションとアプリの 3 つの特徴をまとめることで、
本アプリでできる「魅せる（投稿機能）」「調べる（検索機能）」「繋がる（メッセージ機能）」を
利用者に印象付けられるようにしております。<br>

## Boditore の開発背景

本作品の開発経緯は 2 つあります。<br>
1 つ目は、近年のコロナウイルスの影響で外出の機会が少なくなり運動不足の解消として宅トレなどの運動を始める人が増えたものの、なかなか続かないという声を聞くことが多かったからです。<br>
近年ではスポーツジムも増え運動を始めることが容易にできるようになりましたが、運動は目に見える結果が出るまでに時間がかかり、途中で挫折をしてしまう人が多いので、それを解消するために手軽に情報共有をしながら繋がることのできる SNS 型アプリを作成しました。<br>
2 つ目は、筋トレ経験者が自分に合ったトレーニング方法を見つけやすくしたいと思ったことです。<br>
私自身筋トレを初めて 4 年になり、最初の 3 年はインターネット上の動画などを参考にして筋トレを続けていたのですが、身体に合っていないトレーニングを続けてしまいうまく筋肉をつけることができませんでした。<br>
しかし、独学で栄養学やトレーニング知識をつけたり SNS で筋トレ経験者に話を聞いてそれを実践していった 1 年間で身体が大きく変わったので、この経験から経験者も自分に合ったトレーニング方法を見つけやすくできるようにしたいと思い、筋トレ専用の SNS を作成いたしました。

## 機能一覧/詳細

### ユーザー機能

・新規登録、ログイン、ログアウト、ユーザー情報編集<br>
・ゲストログイン機能<br>
・検索機能（ユーザー画面でトレーニング歴での絞り込みが可能）<br>
・ユーザー一覧表示<br>
・人気ユーザーランキング（フォロワー数順）<br>
・ユーザーアイコン設定、編集<br>
・ユーザーアイコン編集時のプレビュー表示（javascript で実装）
・アチーブメント機能（プロフィール画面）<br>

### 投稿に関する機能

・投稿一覧、投稿、編集、削除機能（Vue.js で SPA 化）<br>
・人気投稿ランキング（お気に入り数順）<br>
・画像投稿、編集機能<br>
・画像のプレビュー表示（Vue.js で実装）
・検索機能（投稿画面で曖昧検索が可能）<br>
・投稿に対するコメント機能<br>
・コメントに対するリプライ機能<br>

### フォロー機能(Ajax)

・フォロー、フォロー解除機能<br>
・フォロー、フォロワー一覧表示機能<br>

### お気に入り機能

・投稿にお気に入りができる機能<br>
・お気に入りをした投稿のカウントが増減する<br>
・お気に入りをした投稿一覧表示機能（プロフィール画面）<br>

### メッセージ機能

・1 対 1 のチャットルームを作成できる<br>
・メッセージ送信機能(Ajax)<br>

### 通知機能

・フォロー、メッセージが他ユーザーからあった場合通知一覧に表示<br>
・通知一括削除機能<br>

### その他機能

・ページネーション機能
・レスポンシブ対応(TailwindCSS で実装)
・トップページの自動スライドアニメーション(javascript で実装)<br>
・メッセージ投稿後の自動更新(javascript で実装)<br>
・モバイル画面のヘッダーメニューバー(javascript で実装)<br>
・プロフィール画面のタブ切り替えによる表示内容の変更(javascript で実装)<br>

## インフラ構成

![Boditore_prototype_AWS構成図](https://user-images.githubusercontent.com/79243411/145733333-e91a617c-8a7f-4e7f-8f57-69e04acf2d1f.png)

## ER 図

![Boditore_ER](https://user-images.githubusercontent.com/79243411/148629474-62011f2b-89b7-477e-9f21-6556f22580cb.png)

## 今後の改良計画

・Vue.js によるアプリの完全 SPA 化<br>
・SPA 実装画面（投稿およびユーザー一覧)のページネーション導入<br>
・食事管理機能（PCF ごとのカロリー入力 → グラフ化）の実装<br>
・Terraform によるインフラのコード管理<br>

#### 最後までお読みいただき、ありがとうございました。
