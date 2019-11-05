# frozen_string_literal: true

require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    @user = users(:soseki)
    @book = @user.books.build(user_id: 1, title: "Test_book", memo: "memo", author: "Soseki")
  end

  test "should be valid" do
    assert @book.valid?
  end

  test "user id should be present" do
    @book.user_id = nil
    assert_not @book.valid?
  end

  test "title should be valid" do
    @book.title = nil
    assert_not @book.valid?
  end

  test "memo should be valid" do
    @book.memo = nil
    assert_not @book.valid?
  end

  test "author should be valid" do
    @book.author = nil
    assert_not @book.valid?
  end
end
