# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @user  = User.find(params[:user_id])
    @users = @user.following.page(params[:page])
    render "users/show_follow"
  end
end
