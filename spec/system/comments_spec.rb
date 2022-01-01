# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  it '新規投稿する' do
    comment = build(:comment)

    post = comment.post

    user = comment.user

    sign_in user

    visit post_path(post)

    click_button 'コメント'

    select comment.category, from: 'コメントカテゴリ'

    fill_in '希望時間', with: comment.available_time

    fill_in '本文', with: comment.content

    find('.modal input[value="コメント"]').click

    expect(current_path).to eq post_path(post)

    expect(page).to have_content comment.content
  end
end
