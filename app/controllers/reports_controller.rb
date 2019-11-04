# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @reports = Report.page(params[:page])
  end

  def show
    @commentable = @report
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = current_user.reports.build(report_params)

    if @report.save
      flash[:notice] = t("reports.create.success")
      redirect_to @report
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      flash[:notice] = t("reports.update.success")
      redirect_to @report
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    flash[:notice] = t("reports.destroy.success")
    redirect_to reports_url
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:title, :content)
    end
end
