# frozen_string_literal: true

require 'rails_helper'

describe Post do
  describe '#create' do
    it '投稿内容が有効である' do
      post = FactoryBot.create(:post)
      expect(post).to be_valid
    end
    it 'タイトルは空欄で投稿できない' do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include
    end
    it '投稿内容は空欄で投稿できない' do
      post = build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include
    end
  end
end
