# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Notifications', type: :system do
  # csrf_meta_tagsを有効にする
  before { ActionController::Base.allow_forgery_protection = true }
  after  { ActionController::Base.allow_forgery_protection = false }

  it '通知する' do
    relationship = create(:relationship)

    user = relationship.follower

    other_user = relationship.followed
    # ログイン
    visit root_path

    click_link 'ログイン'

    fill_in 'user_email', with: user.email

    fill_in 'user_password', with: user.password

    click_button 'ログイン'

    visit user_path(other_user)

    find('.follow-button-delete').click

    find('.follow-button-register').click

    expect(current_path).to eq user_path(other_user)
    # ログアウト
    visit users_path

    click_link 'ログアウト'
    # other_userでログイン
    visit root_path

    click_link 'ログイン'

    fill_in 'user_email', with: other_user.email

    fill_in 'user_password', with: other_user.password

    click_button 'ログイン'

    visit notifications_path

    expect(current_path).to eq notifications_path

    expect(page).to have_content user.name
  end

  it '通知を削除する' do
    relationship = create(:relationship)

    user = relationship.follower

    other_user = relationship.followed
    # ログイン
    visit root_path

    click_link 'ログイン'

    fill_in 'user_email', with: user.email

    fill_in 'user_password', with: user.password

    click_button 'ログイン'

    visit user_path(other_user)

    find('.follow-button-delete').click

    find('.follow-button-register').click

    expect(current_path).to eq user_path(other_user)
    # ログアウト
    visit users_path

    click_link 'ログアウト'
    # other_userでログイン
    visit root_path

    click_link 'ログイン'

    fill_in 'user_email', with: other_user.email

    fill_in 'user_password', with: other_user.password

    click_button 'ログイン'

    visit notifications_path

    find('.notification-delete').click

    expect(current_path).to eq notifications_path

    expect(page).to have_content 'おしらせはありません'
  end
end
