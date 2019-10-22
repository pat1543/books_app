# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]  # GET /books
  # GET /books.json
  def index
    @books = Book.page(params[:page])
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @commentable = @book
    @comments = @commentable.comments
    @comment = Comment.new
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to @book, success: t("books.create.success")
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if @book.update(book_params)
      redirect_to @book, success: t("books.update.success")
    else
      render :edit
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    redirect_to books_url, danger: t("books.destroy.success")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :memo, :author, :picture)
    end
end
