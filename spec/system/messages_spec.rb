# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :system do
  # it '新規投稿する' do
  #   message = build(:message)

  #   user = message.sender

  #   other_user = message.recipient

  #   sign_in user

  #   visit root_path

  #   click_link 'ユーザー'

  #   expect(page).to have_content other_user.name

  #   click_on 'メッセージ'

  #   expect(page).to have_content other_user.name

  #   expect(current_path).to eq messages_user_path(other_user)

  #   expect do
  #     fill_in 'message_content', with: message.content

  #     click_button '送信'
  #   end.to change { Message.count }.by(1)

  #   expect(page).to have_content message.content

  #   expect(current_path).to eq messages_user_path(other_user)
  # end
end
