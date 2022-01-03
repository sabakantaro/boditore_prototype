require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    let!(:comment) { create(:comment, user: user, post: post) }

    it 'user, postが存在する' do
      expect(comment).to be_valid
    end

    it 'コメントを空欄にできない' do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include('を入力してください')
    end

  end
end
