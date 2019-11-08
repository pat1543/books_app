# frozen_string_literal: true

require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Devise::Test::IntegrationHelpers
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  setup do
    @user = users(:soseki)
    sign_in(@user)
    @book = books(:botchan)
    @report = reports(:report1)
  end
end
