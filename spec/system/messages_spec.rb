require 'rails_helper'

# modelでuser, roomの有無を確認しているため実装見送り

# RSpec.describe 'コメント投稿', type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#     # @user2 = FactoryBot.create(:user)
#     # @message = FactoryBot.build(:message)
#     @room = FactoryBot.create(:room)
#   end

#   # ログインしていないユーザーは、コメント投稿フォームが表示されないことを確認済み

#   it 'ログインしたユーザーはトークルームでコメントを投稿できる' do
#     # ログインする
#     # visit new_user_session_path
#     # fill_in 'user_email', with: @user.email
#     # fill_in 'user_password', with: @user.password
#     # find('input[name="commit"]').click
#     # # expect(current_path).to eq root_path
#     # # ツイート詳細ページに遷移する
#     # visit room_path(@room)
#     # # フォームに情報を入力する
#     # # fill_in 'content', with: 'test'
#     # # # コメントを送信すると、Messageモデルのカウントが1上がる
#     # # expect  do
#     #   find('input[name="commit"]').click
#     #   # sleep 1
#     # end.to change {Message.count}.by(1)
#     # コメント内容と「あなたのコメントです」と表示されている
#     # visit tweet_path(@tweet)
#     # expect(page).to have_content(@message.text)
#     # expect(page).to have_content('あなた')
#   end
# end
