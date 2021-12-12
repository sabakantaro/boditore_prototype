# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApplicationController
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

      def destroy
        post = Post.find(params[:id])
        post.destroy!
        render json: post
      end

      private

      def post_params
        params.require(:post).permit(:title, :content, :image).merge(user_id: current_user.id)
      end
    end
  end
end
