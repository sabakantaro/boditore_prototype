# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  describe 'session' do
    let!(:user) { create(:user) }

    it 'ログインする' do
      visit root_path

      click_link 'ログイン'

      expect(current_path).to eq new_user_session_path

      fill_in 'user_email', with: user.email

      fill_in 'user_password', with: user.password

      click_button 'ログイン'

      expect(current_path).to eq root_path

      expect(page).to have_content 'ログインしました。'
    end

    it 'ログアウトする' do
      sign_in user

      visit users_path

      visit users_path

      click_link 'ログアウト'

      expect(current_path).to eq root_path

      expect(page).to have_content 'ログアウトしました。'
    end

    it 'ゲストユーザーとしてログインする' do
      visit root_path

      click_link 'ゲストログイン'

      expect(current_path).to eq root_path

      expect(page).to have_content 'ゲストユーザーとしてログインしました。'
    end
  end

  describe 'registration' do
    let!(:user) { build(:user) }

    it '新規登録する' do
      visit root_path

      expect do
        click_link '新規登録'

        expect(current_path).to eq new_user_registration_path

        fill_in 'user_name', with: user.name

        fill_in 'user_email', with: user.email

        fill_in 'user_password', with: user.password

        fill_in 'user_password_confirmation', with: user.password

        fill_in 'user_profile', with: user.profile

        fill_in 'user_experience', with: user.experience

        click_button '登録'

        expect(page).to have_content 'アカウント登録が完了しました。'
      end.to change(User, :count).by(1)

      expect(current_path).to eq root_path
    end

    it '編集する' do
      user = create(:user)
      # ログイン
      visit root_path

      click_link 'ログイン'

      fill_in 'user_email', with: user.email

      fill_in 'user_password', with: user.password

      click_button 'ログイン'

      visit users_path
      # プロフィール編集
      click_link 'プロフィール編集'

      expect(current_path).to eq edit_user_registration_path

      expect(page).to have_field 'user_name', with: user.name

      expect(page).to have_field 'user_email', with: user.email

      expect(page).to have_field 'user_profile', with: user.profile

      expect(page).to have_field 'user_experience', with: user.experience

      expect(page).to have_field 'user_current_password', with: user.current_password

      expect do
        fill_in 'user_name', with: 'まちおなるぞう'
        fill_in 'user_current_password', with: user.password
        click_button '更新'
      end.to change { User.find(user.id).name }

      expect(current_path).to eq root_path
    end

    it '画像を変更する' do
      user = create(:user)
      # ログイン
      visit root_path

      click_link 'ログイン'

      fill_in 'user_email', with: user.email

      fill_in 'user_password', with: user.password

      click_button 'ログイン'

      visit users_path
      # プロフィール編集
      click_link 'プロフィール編集'

      expect(current_path).to eq edit_user_registration_path

      expect do
        attach_file('image_upload', 'spec/fixtures/testsample.jpg')
        fill_in 'user_current_password', with: user.password
        click_button '更新'
      end.to change { User.find(user.id).image }

      expect(current_path).to eq root_path
    end
  end

  it '詳細を表示する' do
    user = create(:user)

    visit root_path

    # ログイン
    visit root_path

    click_link 'ログイン'

    fill_in 'user_email', with: user.email

    fill_in 'user_password', with: user.password

    click_button 'ログイン'
    # ユーザー画面へ遷移
    visit user_path(user)

    expect(page).to have_content user.name

    expect(page).to have_content user.experience

    expect(page).to have_content user.profile

    expect(current_path).to eq user_path(user)
  end

  it 'フォロー中のユーザーを表示する' do
    relationship = create(:relationship)

    user = relationship.follower

    other_user = relationship.followed

    sign_in user

    visit user_path(user)

    click_link 'フォロー'

    expect(page).to have_content other_user.name
  end

  it 'フォロワーを表示する' do
    relationship = create(:relationship)

    user = relationship.follower

    other_user = relationship.followed

    sign_in user

    visit user_path(other_user)

    click_link 'フォロワー'

    expect(page).to have_content user.name
  end
end
