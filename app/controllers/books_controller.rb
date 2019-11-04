# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] # GET /books

  def index
    @books = Book.page(params[:page])
  end

  def show
    @commentable = @book
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      flash[:notice] = t("books.create.success")
      redirect_to @book
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      flash[:notice] = t("books.update.success")
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = t("books.destroy.success")
    redirect_to books_url
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :memo, :author, :picture)
    end
end
