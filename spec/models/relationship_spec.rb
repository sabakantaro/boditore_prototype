# frozen_string_literal: true

require 'rails_helper'

describe Relationship do
  describe '#create' do
    let(:follower) { create(:user) }
    let(:followed) { create(:user) }
    let!(:relationship) { create(:relationship, follower: follower, followed: followed) }

    it 'follower, followedが存在する' do
      expect(relationship).to be_valid
    end

    it 'followerとfollowedは重複しない' do
      relationship = build(:relationship, follower: follower, followed: followed)
      relationship.valid?
      expect(relationship.errors[:follower_id]).to include
    end

    it 'followerが存在する' do
      relationship = build(:relationship, follower: nil)
      relationship.valid?
      expect(relationship.errors[:follower]).to include('を入力してください')
    end

    it 'followingが存在する' do
      relationship = build(:relationship, followed: nil)
      relationship.valid?
      expect(relationship.errors[:followed]).to include('を入力してください')
    end
  end
end
