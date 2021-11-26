require 'rails_helper'

describe Message do
  describe '#create' do
    it 'メッセージは空欄で投稿できない' do
      message = build(:message, content: nil)
      message.valid?
      expect(message.errors[:content]).to include
    end

    it 'roomが存在する' do
      message = build(:message, room_id: nil)
      message.valid?
      expect(message.errors[:room]).to include('を入力してください')
    end

    it 'userが存在する' do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user]).to include('を入力してください')
    end
  end
end
