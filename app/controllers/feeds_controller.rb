# frozen_string_literal: true

class FeedsController < ApplicationController
  def index
    books = Book.where("user_id IN (?) OR user_id = ?", current_user.following_ids, current_user.id)
    @books = books.page(params[:page])
    render "books/index"
  end
end
