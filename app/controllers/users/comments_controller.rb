# frozen_string_literal: true

class Users::CommentsController < ApplicationController
  before_action :set_commentable

  def index
    @user  = User.find(params[:user_id])
    comments = Comment.where("user_id = ?", current_user.id)
    @comments = comments.page(params[:page])
    render "users/show_comment"
  end

  private
    def set_commentable
      resource, id = request.path.split('/')[2,3]
      @commentable = resource.singularize.classify.constantize.find(id)
    end
end
