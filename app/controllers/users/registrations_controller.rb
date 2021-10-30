class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: :destroy

  def ensure_normal_user
    if resource.email == 'aaa@aaa.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end

end
