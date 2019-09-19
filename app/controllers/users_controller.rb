# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def following
    @title = t("users.users_controller.following.following")
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render "show_follow"
  end

  def followers
    @title = t("users.users_controller.followers.followers")
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render "show_follow"
  end
end
