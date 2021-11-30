require 'rails_helper'

describe User, type: :model do
  describe '#create' do
    it 'userが存在する' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it 'name, email, passwordなしでは登録できない' do
      user = User.new(
        name: 'Tester',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze',
        password_confirmation: 'dottle-nouveau-pavilion-tights-furze',
        profile: 'test',
        experience: '1'
      )
      expect(user).to be_valid
    end

    it '@ がメールアドレスに含まれていること' do
      User.create(email: 'tester@example.com')
      user = User.new(email: 'yamadacom')
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end

    it 'メールアドレスが重複しないこと' do
      User.create(
        name: 'Tester',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze',
        profile: 'test',
        experience: '1'
      )
      user = User.new(
        name: 'Test',
        email: 'tester@example.com',
        password: 'dottle-nouveau-pavilion-tights-furze',
        profile: 'test',
        experience: '1'
      )
      user.valid?
      expect(user.errors[:email]).to include('はすでに存在します')
    end

    it 'パスワードは6文字以上であること' do
      user = User.new(password: '12345', password_confirmation: '12345')
      user.valid?
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
    end

    it 'password_confirmationはpasswordと同じであること' do
      user = User.new(password: '000000', password_confirmation: '111111')
      user.valid?
      expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
    end
  end
end
