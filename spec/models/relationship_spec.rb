require 'rails_helper'

describe Relationship do
  describe '#create' do
    let(:follower) { create(:user) }
    let(:followed) { create(:user) }
    let!(:relationship) { create(:relationship, follower: follower, followed: followed) }

    it "must exist (follower, followed)" do
      expect(relationship).to be_valid
    end

    it "cannot exist the same sets of follower and followed" do
      relationship = build(:relationship, follower: follower, followed: followed)
      relationship.valid?
      expect(relationship.errors[:follower_id]).to include
    end

    it "must exist (follower)" do
      relationship = build(:relationship, follower: nil)
      relationship.valid?
      expect(relationship.errors[:follower]).to include("must exist")
    end

    it "must exist (following)" do
      relationship = build(:relationship, followed: nil)
      relationship.valid?
      expect(relationship.errors[:followed]).to include("must exist")
    end
  end
end
