require 'rails_helper'

describe Notification do
  describe '#create' do
      it "notifies to be gived a message" do
        notification = build(:notification, action: "message")
        expect(notification).to be_valid
      end

      it "notifies to be followed" do
        notification = build(:notification, action: "follow")
        expect(notification).to be_valid
      end

  end
end
