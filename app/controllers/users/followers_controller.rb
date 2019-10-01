# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    @title = t(".followers")
    @user  = User.find(params[:user_id])
    @users = @user.followers.page(params[:page])
    render "users/show_follow"
  end
end
