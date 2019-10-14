# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.page(params[:page])
  end

  def show
    @comment = @commentable.comments.build
  end

  def new
    @comment = @commentable.comments.build
  end

  def edit
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @commentable, notice: "Comment was successfully created."
    else
      render :new
    end
   end

  def update
    if @comment.update(comment_params)
      redirect_to @commentable, notice: "Comment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: "Comment was successfully destroyed."
  end

  private
    def set_commentable
      resource, id = request.path.split("/")[2, 3]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
