# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  # it '新規投稿する' do
  #   comment = create(:comment)

  #   post = comment.post

  #   user = comment.user
  #   # ログイン
  #   sign_in user

  #   visit post_path(post)

  #   find('.comment-text').set(comment.text)

  #   click_button '送信'

  #   expect(current_path).to eq post_path(post)

  #   expect(page).to have_content comment.text
  # end

  # it 'コメントに返信する' do
  #   comment = create(:comment)

  #   post = comment.post

  #   user = comment.user
  #   # ログイン
  #   visit root_path

  #   click_link 'ログイン'

  #   fill_in 'user_email', with: user.email

  #   fill_in 'user_password', with: user.password

  #   click_button 'ログイン'

  #   visit post_path(post)

  #   find('.reply-text').set(comment.text)

  #   click_button '送信'

  #   expect(current_path).to eq post_path(post)

  #   expect(page).to have_content comment.text
  # end
end
