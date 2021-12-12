# frozen_string_literal: true

require 'rails_helper'

describe Notification do
  describe '#create' do
    it 'messageを受信したら通知する' do
      notification = build(:notification, action: 'message')
      expect(notification).to be_valid
    end

    it 'フォローされたら通知する' do
      notification = build(:notification, action: 'follow')
      expect(notification).to be_valid
    end
  end
end
