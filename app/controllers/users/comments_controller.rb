# frozen_string_literal: true

class Users::CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @comments = @user.comments.page(params[:page])
    render "users/show_comment"
  end
end
