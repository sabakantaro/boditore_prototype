# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :system do
  it '新規投稿する' do
    user = create(:user)

    other_user = create(:other_user)
    # ログイン
    visit root_path

    click_link 'ログイン'

    fill_in 'user_email', with: user.email

    fill_in 'user_password', with: user.password

    click_button 'ログイン'

    visit user_path(other_user)

    find('.message').click

    expect do
      find('.message_form-text').set('筋トレするかしないかどっちなーんだい！')

      click_button '投稿'

      visit user_path(other_user)

      find('.message').click
    end.to change { Message.count }.by(1)
  end
end
