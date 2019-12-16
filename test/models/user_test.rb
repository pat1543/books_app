# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:soseki)
    @other_user = users(:akutagawa)
  end

  test "dummy_email can be created" do
    auth = OmniAuth::AuthHash.new
    auth.define_singleton_method(:provider) do
      "github"
    end
    auth.define_singleton_method(:uid) do
      1
    end
    email = User.dummy_email(auth)
    assert_equal(email, "#{auth.uid}-#{auth.provider}@example.com")
  end

  test "user through github_oauth can be created" do
    auth = OmniAuth::AuthHash.new
    auth.define_singleton_method(:provider) do
      "github"
    end
    auth.define_singleton_method(:uid) do
      1
    end
    auth.info.define_singleton_method(:name) do
      "Soseki"
    end
    user = User.find_for_github_oauth(auth)
    assert user
  end

  test "should follow and unfollow a user" do
    assert @user.following?(@other_user)
    @user.follow(@other_user)
    assert @user.following?(@other_user)
    @user.unfollow(@other_user)
    assert_not @user.following?(@other_user)
  end
end
