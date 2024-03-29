# frozen_string_literal: true

require 'faker'

#ユーザー、投稿、お気に入り
10.times do |i|
  i += 1
  profile = ['','筋トレ好きサラリーマンです。裸ネクタイがチャームポイント。', '海の男。個人でパーソナルやってます。一緒にキレイな体目指しましょう！','現役フィジーク選手｜入賞経験あり｜仕事はジム経営やってます。最近寝不足。。。','はじめまして！アウトドア好きなマッチョの方、ぜひフォローオネシャス☆フォロバ1,000%','エンジニアやってます！健康管理アプリ作ってる関係でカロリー計算とか詳しいので、相談乗ります！','Hello! I love my muscle all of the world!! Please follow me!!!','農学部学生。筋トレ。散歩。瞑想。たまに迷走','初めまして！プロテインバーの店員やってます！他にもパーソナルトレーニングやってますので、お気軽にお声掛けくださいm(_ _)m','モテたくて筋トレはじめました！次のバチェラー目指してます！','プロフィールご覧いただきありがとうございます。・好き：筋トレ、カフェ巡り、チートデイ・嫌い：ダイエット、上司']
  user = User.create!(
    name: Gimei.first.katakana,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    profile: "#{profile[i]}",
    experience: rand(1..9)
  )
  user.image.attach(io: File.open(Rails.root.join("./db/fixtures/image#{i}.jpg")), filename: 'image#{i}.jpg')

  10.times do |j|
    j += 1
    title = ['','マッチョは仕事もできる！？', 'いつもと違う刺激を！','筋肉を休めよう','水分補給できてますか？','朝トレで仕事のやる気スイッチON','チェストのワークアウトおすすめ！','自然と一体になる','筋肉とお酒','モテたいなら・・・筋トレしろ！','筋トレと糖質']
    content = ['','筋トレ、つまり運動をすると血液循環がよくなり集中力が増します。さらに筋肉がつくことで身体が軽く感じられ、気分的にもポジティブになれます。その結果、仕事もできるようになるのです！','筋肉も人間と同じで感情を持っています。だからいつも同じようなトレーニングをしていると飽きてしまい、成長しにくくなるのです、、、だからこそ、たまにはケーブルや軽いダンベルで高回数やるような日を作りましょう！そうすれば筋肉もやる気を取り戻して大きくなってくれます！','みなさん、睡眠はしっかり取れてますか？筋肉は体から見たら「いらないもの」なので、ちゃんと休まないと分解してエネルギーとして使われます。筋肉を育てるには食事の他、休養も大事にしましょう！','バルクアップでもダイエットでも水分補給が重要となります。体に十分な水分がないと体内の循環が悪くなり、栄養素を届けにくくなったり、疲労物質を除去しにくくなりして結果的に筋肉がつきにくい、痩せにくい体になります。水は普段からこまめに取りましょう！','サラリーマンだと仕事帰りや休日に筋トレをすることは多いのではないでしょうか？朝にやると疲れて仕事に集中できないと言われることがありますが、朝から血液を循環させて体温を上げることで最初から仕事モードに入れますよ！','今日のワークアウト、ダンベルフライです！下ろすときに肘をなるべく床の方向に落とし、チェストをストレッチさせます！','厳しい人間関係の波に揉まれてるみなさん、たまには何も考えず自然と一体になりましょう。自然には自律神経をリラックスさせる効果がありますので、Youtubeとかで自然音を聴いて目を瞑るだけでもいいんでお試しください。','筋トレも好きだけどお酒も飲みたい！そんな方は筋トレ後時間を空けてから飲みましょう！筋トレ後は筋肉合成が進み、いわゆる筋肉の「成長期」なのでダメですが、時間を空けて落ち着いてきたら飲みましょう！ほどほどに！笑','モテたいですか？モテたいですよね？そしたら筋トレをしましょう。すると、テストステロンと呼ばれる男性ホルモンの数値が上がり、筋肉も付き、着る服もカッコよく見え、お洒落になる。そして活力に漲り仕事もできるようになる・・・モテない未来なんて見えませんね？','筋トレ後はプロテイン！と思われるかもしれませんが、それだけじゃダメ。糖質はトレーニング中のエネルギーになり、そしてタンパク質を体に届ける配達員にもなります。まずは筋トレ後のプロテインと一緒に糖質も足してあげましょう！']
    tag = ['','その他','筋トレ','筋トレ','食事','筋トレ','筋トレ','その他','食事','筋トレ','食事']
    post = Post.create(
      title: "#{title[j]}",
      content: "#{content[j]}",
      tag: "#{tag[j]}",
      user_id: user.id
    )
    post.eyecatch.attach(io: File.open(Rails.root.join("./db/fixtures/image#{j}.jpg")), filename: 'image#{j}.jpg')

    Favorite.create(post_id: i, user_id: j)
  end
end

#ユーザー
90.times do |i|
  user = User.create!(
    name: Gimei.first.katakana,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    profile: "よろしくお願いします！",
    experience: rand(1..9)
  )
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..100]
followers = users[3..90]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
