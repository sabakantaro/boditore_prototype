# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end

  it '新規投稿する' do
    visit root_path
    # ログイン
    click_link 'ログイン'

    fill_in 'user_email', with: @user.email

    fill_in 'user_password', with: @user.password

    click_button 'ログイン'

    visit posts_path

    fill_in 'title', with: @post.title

    find('input[type="submit"]').click
  end

  it '詳細を表示する' do
    visit root_path
    # ログイン
    click_link 'ログイン'

    fill_in 'user_email', with: @user.email

    fill_in 'user_password', with: @user.password

    click_button 'ログイン'

    visit post_path(@post)

    expect(current_path).to eq post_path(@post)

    expect(page).to have_content @post.title

    expect(page).to have_content @post.content

    expect(current_path).to eq post_path(@post)

    expect(page).to have_content Post.find(@post.id).title
  end

  # it '編集する' do
  #   visit root_path
  #   # ログイン
  #   click_link 'ログイン'

  #   fill_in 'user_email', with: @user.email

  #   fill_in 'user_password', with: @user.password

  #   click_button 'ログイン'

  #   visit post_path(@post)

  #   visit "/api/v1/posts/#{@post.id}"

  #   expect do
  #     find('.post-title').set('大胸筋が歩いてる！')

  #     click_button '更新'

  #     visit post_path(@post)
  #   end.to change { Post.find(@post.id).title }

  #   expect(current_path).to eq post_path(@post)

  #   expect(page).to have_content Post.find(@post.id).title
  # end

  # it '画像を変更する' do
  #   visit root_path
  #   # ログイン
  #   click_link 'ログイン'

  #   fill_in 'user_email', with: @user.email

  #   fill_in 'user_password', with: @user.password

  #   click_button 'ログイン'

  #   visit post_path(@post)

  #   visit "/api/v1/posts/#{@post.id}"

  #   expect do
  #     attach_file('image_upload', 'spec/fixtures/testsample.jpg')

  #     click_button '更新'

  #     visit post_path(@post)
  #   end.to change { Post.find(@post.id).eyecatch }

  #   expect(current_path).to eq post_path(@post)
  # end

  it '投稿を検索する' do
    user = create(:user)

    sign_in user

    visit posts_path

    find('.post-search').set(@post.title)

    visit search_posts_path

    expect(current_path).to eq search_posts_path
  end
end
