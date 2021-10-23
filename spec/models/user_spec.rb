require 'rails_helper'

describe User, type: :model do
  describe '#create' do
    it 'userが存在する' do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "name, email, passwordなしでは登録できない" do
        user = User.new(
        name: "Tester",
        email:      "tester@example.com",
        password:   "dottle-nouveau-pavilion-tights-furze",
        password_confirmation:   "dottle-nouveau-pavilion-tights-furze"
        )
      expect(user).to be_valid
    end

    # it "is invalid without @ in an email" do
    #   User.create(email: "tester@example.com")
    #   user = User.new(email: "yamadacom")
    #   user.valid?
    #   expect(user.errors[:email]).to include("is invalid")
    # end

    #  it "is invalid with a duplicate email address" do
    # User.create(
    #     name:  "Tester",
    #     email:      "tester@example.com",
    #     password:   "dottle-nouveau-pavilion-tights-furze",
    #     )
    # user = User.new(
    #     name:  "Test",
    #     email:      "tester@example.com",
    #     password:   "dottle-nouveau-pavilion-tights-furze",
    #     )
    #   user.valid?
    #   expect(user.errors[:email]).to include("has already been taken")
    # end

    # it "is too short (minimum is 6 characters)" do
    #   user = User.new(password: "12345", password_confirmation: "12345")
    #   user.valid?
    #   expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    # end

    # it "is expected same as pasword" do
    #   user = User.new(password: "000000", password_confirmation: "111111")
    #   user.valid?
    #   expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    # end
  end
end
