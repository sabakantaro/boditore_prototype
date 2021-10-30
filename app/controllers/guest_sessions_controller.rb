class GuestSessionsController < ApplicationController
  def create
    user = User.find_or_create_by(email: "guest@exapmle.com") do |user|
      user.password = password
      user.password_confirmation = user.password
      user.name = "ゲストユーザー"
    end
      sign_in user
      redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
