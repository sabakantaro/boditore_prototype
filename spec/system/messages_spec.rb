# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :system do
  # it '新規投稿する' do
  #   message = create(:message)

  #   user = message.user

  #   other_user = message.other_user
  #   #ログイン
  #   visit root_path

  #   click_link 'ログイン'

  #   fill_in 'user_email', with: user.email

  #   fill_in 'user_password', with: user.password

  #   click_button 'ログイン'

  #   visit user_path(other_user)

  #   visit room_path(other_user)

  #   # expect(page).to have_content other_user.name

  #   expect(current_path).to eq room_path(other_user)

  #   expect do
  #     fill_in 'message_content', with: message.content

  #     click_button '投稿'
  #   end.to change { Message.count }.by(1)

  #   expect(page).to have_content message.content

  #   expect(current_path).to eq rooms_user_path(other_user)
  # end
end
