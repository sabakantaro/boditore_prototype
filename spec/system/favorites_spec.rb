# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favorites', type: :system do
  # csrf_meta_tagsを有効にする
  # before { ActionController::Base.allow_forgery_protection = true }
  # after  { ActionController::Base.allow_forgery_protection = false }

  # it 'いいねをする' do
  #   Favorite = build(:Favorite)

  #   post = Favorite.post

  #   user = Favorite.user

  #   sign_in user

  #   visit post_path(post)

  #   expect do
  #     find('.Favorite-button-register').click

  #     expect(page).to have_css '.Favorite-button-delete', visible: false
  #   end.to change { Favorite.count }.by(1)

  #   expect(current_path).to eq post_path(post)
  # end

  # it 'いいねを取り消す' do
  #   Favorite = create(:Favorite)

  #   post = Favorite.post

  #   user = Favorite.user

  #   sign_in user

  #   visit post_path(post)

  #   expect do
  #     find('.favorite-button-delete').click

  #     expect(page).to have_css '.favorite-button-register', visible: false
  #   end.to change { Favorite.count }.by(-1)

  #   expect(current_path).to eq post_path(post)
  # end
end
