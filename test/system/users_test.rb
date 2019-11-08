# frozen_string_literal: true

require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit users_path
    assert_selector "h1", text: "ユーザー一覧"
  end

  test "visiting a user" do
    visit user_path(I18n.locale, @user)
    assert_selector "h1", text: "#{@user.name}のプロフィール"
  end

  test "creating a user" do
    visit root_path
    click_on "Logout"
    visit new_user_registration_path
    assert_text "アカウント登録"
    fill_in "名前", with: "soseki"
    fill_in "Eメール", with: "soseki@test.com"
    fill_in "パスワード", with: "password"
    fill_in "パスワード（確認用）", with: "password"
    fill_in "郵便番号", with: "111-1111"
    fill_in "住所", with: "東京都"
    fill_in "自己紹介", with: "はじめまして"
    click_on "アカウント登録"
    assert_text "アカウント登録が完了しました。"
  end

  test "updating a user" do
    visit root_path
    click_on "Edit profile"
    assert_text "ユーザ編集"
    fill_in "名前", with: "soseki"
    fill_in "Eメール", with: "soseki@test.com"
    fill_in "パスワード", with: "password"
    fill_in "パスワード（確認用）", with: "password"
    fill_in "現在のパスワード", with: "password"
    fill_in "郵便番号", with: "111-1111"
    fill_in "住所", with: "東京都"
    fill_in "自己紹介", with: "はじめまして"
    click_on "更新"
    assert_text "アカウント情報を変更しました。"
  end

  test "destroying a user" do
    visit root_path
    click_on "Edit profile"
    page.accept_confirm do
      click_on "アカウント削除"
    end
    assert_text "アカウントを削除しました。またのご利用をお待ちしております。"
  end

  test "logging in" do
    visit root_path
    click_on "Logout"
    click_on "Login"
    fill_in "Eメール", with: "#{@user.email}"
    fill_in "パスワード", with: "password"
    click_on "ログイン"
    assert_text "ログインしました。"
  end
end
