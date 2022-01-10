# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users_list', type: :system do
  describe '一覧表示する' do
    # csrf_meta_tagsを有効にする
    before { ActionController::Base.allow_forgery_protection = true }
    after  { ActionController::Base.allow_forgery_protection = false }

    it 'ユーザーを一覧表示する' do
      user = create(:user)

      other_user = create(:other_user)

      sign_in user

      visit users_path

      expect(page).to have_content user.name

      expect(page).to have_content other_user.name
    end

    it 'ユーザー詳細画面を開く' do
      user = create(:user)

      sign_in user

      visit users_path

      click_on 'プロフィール詳細'

      expect(current_path).to eq user_path(user)
    end

    it 'ユーザー編集画面を開く' do
      user = create(:user)

      sign_in user

      visit users_path

      click_on 'プロフィール編集'

      expect(current_path).to eq edit_user_registration_path
    end

    it 'ログアウトする' do
      user = create(:user)

      sign_in user

      visit users_path

      click_link 'ログアウト'

      expect(current_path).to eq root_path

      expect(page).to have_content 'ログアウトしました。'
    end

    it 'ユーザー一覧画面からユーザー詳細画面を開く' do
      user = create(:user)

      sign_in user

      visit users_path

      find('.users-show').click

      expect(current_path).to eq user_path(user)
    end
  end

  describe '検索する' do
    it 'ユーザーを検索する' do
      user = create(:user)

      sign_in user

      visit users_path

      find('.user-search').set(5)

      visit search_users_path

      expect(current_path).to eq search_users_path
    end
  end
end
