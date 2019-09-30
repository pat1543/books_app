# frozen_string_literal: true

class Users::ReportsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reports = @user.reports.page(params[:page])
    render template: "users/show_reports"
  end
end
