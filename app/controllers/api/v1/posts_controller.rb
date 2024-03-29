# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
      # before_action :authenticate_user, only: [:edit, :destroy, :update]
      skip_before_action :verify_authenticity_token

      def index
        posts = Post.all
        render json: posts, methods: [:image_url]
      end

      def create
        post = Post.new(post_params)
        post = current_user.posts.build(post_params)
        post.user_id = current_user.id
        if post.save!
          post.eyecatch = post_params[:image]
          render json: post, methods: [:image_url]
        else
          render json: post.errors, status: 422
        end
      end

      def edit; end

      def update
        post = Post.find(params[:id])
        if post.update_attributes(post_params)
          post.eyecatch = post_params[:image]
          render json: post, methods: [:image_url]
        else
          render json: post.errors, status: 422
        end
      end

      def show
        post = Post.find_by(id: params[:id])
        render json: post, methods: [:image_url]
      end

      def destroy
        post = Post.find(params[:id])
        post.destroy!
        render json: post, methods: [:image_url]
      end

      private
      # def authenticate_user
      #   unless Post.find(params[:id]).user.id.to_i == current_user.id
      #       redirect_to root_path, alert: '自分以外の投稿を編集・削除できません。'
      #   end
      # end

      def post_params
        params.require(:post).permit(:title, :content, :image, :tag).merge(user_id: current_user.id)
      end
    end
  end
end
