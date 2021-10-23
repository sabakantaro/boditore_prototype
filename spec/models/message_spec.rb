require 'rails_helper'

describe Message do
  describe '#create' do

    it "メッセージは空欄で投稿できない" do
      message = build(:message, content: nil)
      message.valid?
      expect(message.errors[:content]).to include
    end

    # it "must exist (room)" do
    #   message = build(:message, room_id: nil)
    #   message.valid?
    #   expect(message.errors[:room]).to include("must exist")
    # end

    # it "must exist (user)" do
    #   message = build(:message, user_id: nil)
    #   message.valid?
    #   expect(message.errors[:user]).to include("must exist")
    
    # end
  end
end
