# frozen_string_literal: true

require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  setup do
    @user = users(:soseki)
    sign_in(@user)
    @report = reports(:report1)
  end

  test "visiting the index" do
    visit reports_path
    assert_selector "h1", text: "日報一覧"
  end

  test "visiting a report" do
    visit report_path(I18n.locale, @report)
    assert_selector "h3", text: "日報詳細"
  end

  test "creating a report" do
    visit reports_path
    click_on "新規追加", match: :first
    fill_in "タイトル", with: @report.title
    fill_in "内容", with: @report.content
    click_on "追加する"
    assert_text "日報が追加されました"
  end

  test "updating a report" do
    visit reports_path
    click_on "編集", match: :first
    fill_in "タイトル", with: @report.title
    fill_in "内容", with: @report.content
    click_on "追加する"
    assert_text "日報が編集されました"
  end

  test "destroying a report" do
    visit reports_path
    page.accept_confirm do
      click_on "削除"
    end
    assert_text "日報が削除されました"
  end
end
