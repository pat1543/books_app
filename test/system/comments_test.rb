# frozen_string_literal: true

require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @user = users(:soseki)
    sign_in(@user)
    @book = books(:botchan)
    @report = reports(:report1)
  end

  test "visiting the book index" do
    visit user_comments_path(I18n.locale, @user)
    assert_selector "h1", text: "#{@user.name}のコメント一覧"
  end

  test "creating a book comment" do
    visit book_path(I18n.locale, @book)
    fill_in "内容", with: "コメント"
    click_on "追加する"
    assert_text "コメントが追加されました"
  end

  test "updating a book comment" do
    visit book_path(I18n.locale, @book)
    fill_in "内容", with: "コメント"
    click_on "追加する"
    click_on "comment"
    assert_selector "h1", text: "コメントの編集"
    fill_in "内容", with: "編集コメント"
    click_on "追加する"
    assert_text "コメントが編集されました"
  end

  test "destroying a book comment" do
    visit book_path(I18n.locale, @book)
    fill_in "内容", with: "コメント"
    click_on "追加する"
    page.accept_confirm do
      click_on "削除"
    end
    assert_text "コメントが削除されました"
  end

  test "creating a report comment" do
    visit report_path(I18n.locale, @report)
    fill_in "内容", with: "コメント"
    click_on "追加する"
    assert_text "コメントが追加されました"
  end

  test "updating a report comment" do
    visit report_path(I18n.locale, @report)
    fill_in "内容", with: "コメント"
    click_on "追加する"
    click_on "comment"
    assert_selector "h1", text: "コメントの編集"
    fill_in "内容", with: "編集コメント"
    click_on "追加する"
    assert_text "コメントが編集されました"
  end

  test "destroying a report comment" do
    visit report_path(I18n.locale, @report)
    fill_in "内容", with: "コメント"
    click_on "追加する"
    page.accept_confirm do
      click_on "削除"
    end
    assert_text "コメントが削除されました"
  end
end
