# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @login_user = User.find(current_user.id)
  end
end
