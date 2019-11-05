# frozen_string_literal: true

require "test_helper"

class ReportTest < ActiveSupport::TestCase
  def setup
    @user = users(:soseki)
    @report = @user.reports.build(user_id: 1, title: "Test_report", content: "I am a cat.")
  end

  test "should be valid" do
    assert @report.valid?
  end
end
