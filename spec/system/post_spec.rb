require 'rails_helper'

RSpec.describe '新規投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
  end

  context '新規投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      # 新規投稿ページへ遷移する
      visit new_post_path
      # フォームに情報を入力する
      fill_in 'title', with: @post.title
      fill_in 'content', with: @post.content
      find('input[name="commit"]').click
    end
  end

  context '新規投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # 投稿画面へ遷移する
      visit new_post_path
      # ログイン画面へ戻される
      expect(current_path).to eq '/users/sign_in'
    end
    # it '投稿内容が空だと投稿できない' do
    #     # ログインする
    #     visit new_user_session_path
    #     fill_in 'user_email', with: @user.email
    #     fill_in 'user_password', with: @user.password
    #     find('input[name="commit"]').click
    #     # 新規投稿ページへ遷移する
    #     visit new_post_path
    #     # フォームが空のまま、投稿ボタンを押す
    #     fill_in 'title', with: ''
    #     fill_in 'content', with: ''
    #     find('input[name="commit"]').click
    #     # 新規投稿ページへ戻される
    #     expect(current_path).to eq post_path(@post)
    # end
  end
end

RSpec.describe '投稿詳細', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end
  it 'ログインしたユーザーは、投稿詳細ページに遷移できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    find('input[name="commit"]').click
    # 投稿詳細ページへ遷移する
    visit post_path(@post)
  end
  it 'ログインしていない状態では、投稿詳細ページに遷移できない' do
    # トップページに移動する
    visit root_path
    # 投稿詳細ページへ遷移する
    visit post_path(@post)
    # ユーザー登録画面に戻される
    expect(current_path).to eq '/users/sign_in'
  end
end
