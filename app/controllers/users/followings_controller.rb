# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @title = t("users.users_controller.following.following")
    @user  = User.find(params[:user_id])
    @users = @user.following.page(params[:page])
    render "users/show_follow"
  end
end
