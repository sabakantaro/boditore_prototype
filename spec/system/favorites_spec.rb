# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favorites', type: :system do
  # csrf_meta_tagsを有効にする
  before { ActionController::Base.allow_forgery_protection = true }
  after  { ActionController::Base.allow_forgery_protection = false }

  it 'いいねをする' do
    favorite = create(:favorite)

    post = favorite.post

    user = favorite.user
    #ログイン
    visit root_path

    click_link 'ログイン'

    fill_in 'user_email', with: user.email

    fill_in 'user_password', with: user.password

    click_button 'ログイン'

    visit post_path(post)

    find('.favorite-button-delete').click

    expect do
      find('.favorite-button-register').click

      expect(page).to have_css '.favorite-button-delete', visible: false
    end.to change { Favorite.count }.by(1)

    expect(current_path).to eq post_path(post)
  end

  it 'いいねを取り消す' do
    favorite = create(:favorite)

    post = favorite.post

    user = favorite.user
    #ログイン
    visit root_path

    click_link 'ログイン'

    fill_in 'user_email', with: user.email

    fill_in 'user_password', with: user.password

    click_button 'ログイン'

    visit post_path(post)

    expect do
      find('.favorite-button-delete').click

      expect(page).to have_css '.favorite-button-register', visible: false
    end.to change { Favorite.count }.by(-1)

    expect(current_path).to eq post_path(post)
  end
end
