# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  # it '新規投稿する' do
  #   comment = build(:comment)

  #   post = comment.post

  #   user = comment.user

  #   sign_in user

  #   visit post_path(post)

  #   click_button 'コメント'

  #   select comment.category, from: 'コメントカテゴリ'

  #   fill_in '希望時間', with: comment.available_time

  #   fill_in '本文', with: comment.content

  #   find('.modal input[value="コメント"]').click

  #   expect(current_path).to eq post_path(post)

  #   expect(page).to have_content comment.content
  # end

  # it '編集する' do
  #   comment = create(:comment)

  #   post = comment.post

  #   user = comment.user

  #   sign_in user

  #   visit post_path(post)

  #   click_button '編集'

  #   fill_in '本文', with: 'NewContent'

  #   find('.modal input[value="コメント"]').click

  #   expect(current_path).to eq post_path(post)

  #   expect(page).to have_content 'NewContent'
  # end

  # it '削除する' do
  #   comment = create(:comment)

  #   post = comment.post

  #   user = comment.user

  #   sign_in user

  #   visit post_path(post)

  #   expect do
  #     page.accept_confirm('本当に削除しますか？') do
  #       click_button '削除'
  #     end

  #     expect(page).to have_content 'コメントが削除されました。'

  #     expect(current_path).to eq post_path(post)
  #   end.to change(Comment, :count).by(-1)
  # end

  # it '承認する' do
  #   comment = create(:comment)

  #   post = comment.post

  #   user = post.user

  #   sign_in user

  #   visit post_path(post)

  #   expect do
  #     find('.comments-unapproved').click

  #     expect(page).to have_css '.comments-approved', visible: false
  #   end.to change { Comment.find(comment.id).approved }.from(false).to(true)

  #   expect(current_path).to eq post_path(post)
  # end
end
