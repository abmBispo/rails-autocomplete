# frozen_string_literal: true

class PostsController < ApplicationController
  def create
    @post = Post.new(posts_params)
    if @post.save
      render json: @post
    else
      render json: { error: @post.errors.messages.values.flatten.first }, status: 406
    end
  end

  def index
    @posts = Post.search(params[:q] || '*', page: params[:page], per_page: params[:per_page] || 25)
    render json: @posts
  end

  private

  def posts_params
    params.permit(:title, :body)
  end
end
