# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @user = users(:soseki)
    sign_in(@user)
    @book = books(:botchan)
  end

  test "visiting the index" do
    visit books_path
    assert_selector "h1", text: "本一覧"
  end

  test "visiting a book" do
    visit book_path(I18n.locale, @book)
    assert_selector "h3", text: "本詳細"
  end

  test "creating a book" do
    visit new_book_path
    fill_in "著者", with: @book.author
    fill_in "メモ", with: @book.memo
    fill_in "タイトル", with: @book.title
    click_on "追加する"
    assert_text "本が追加されました"
  end

  test "updating a book" do
    visit books_path
    click_on "編集", match: :first
    fill_in "著者", with: @book.author
    fill_in "メモ", with: @book.memo
    fill_in "タイトル", with: @book.title
    click_on "追加する"
    assert_text "本が編集されました"
  end

  test "destroying a book" do
    visit books_path
    page.accept_confirm do
      click_on "削除"
    end
    assert_text "本が削除されました"
  end
end
