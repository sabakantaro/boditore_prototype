module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: users, methods: [:image_url]
      end
    end
  end
end
