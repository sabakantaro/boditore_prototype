require 'rails_helper'

describe Favorite do
  describe '#create' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    let!(:favorite) { create(:favorite, user: user, post: post) }

    it "user, postが存在する" do
      expect(favorite).to be_valid
    end

    it "1投稿にお気に入りできるuserが重複しない" do
      favorite = build(:favorite, user: user, post: post)
      favorite.valid?
      expect(favorite.errors[:post_id]).to include
    end

    # it "cannot be empty" do
    #   favorite = build(:favorite, post: nil)
    #   favorite.valid?
    #   expect(favorite.errors[:post]).to include("must exist")
    # end

    # it "cannot be empty for user" do
    #   favorite = build(:favorite, user: nil)
    #   favorite.valid?
    #   expect(favorite.errors[:user]).to include("must exist")
    # end
  end
end
