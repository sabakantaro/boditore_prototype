# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Relationships', type: :system do
  # csrf_meta_tagsを有効にする
  before { ActionController::Base.allow_forgery_protection = true }
  after  { ActionController::Base.allow_forgery_protection = false }

  it 'フォローする' do
    relationship = build(:relationship)

    user = relationship.follower

    other_user = relationship.followed

    sign_in user

    visit user_path(other_user)

    expect do
      find('.follow-button-register').click

      expect(page).to have_css '.follow-button-delete', visible: false
    end.to change { Relationship.count }.by(1)

    expect(current_path).to eq user_path(other_user)
  end

  it 'フォロー解除する' do
    relationship = create(:relationship)

    user = relationship.follower

    other_user = relationship.followed

    sign_in user

    visit user_path(other_user)

    expect do
      find('.follow-button-delete').click

      expect(page).to have_css '.follow-button-register', visible: false
    end.to change { Relationship.count }.by(-1)

    expect(current_path).to eq user_path(other_user)
  end
end
