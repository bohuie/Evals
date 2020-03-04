class ReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def create
    
    if current_user.admin
      if params[:report] == "student"
        @report = Report.new
        @report.user = User.find(params[:user][:id])
        @report.peer_evals = @report.user.peer_evals.where(:milestone => params[:milestones][:id])
        @report_type = params[:report]
      elsif params[:report] == "evals"
        @report = Report.new
        @report.user = User.find(params[:user][:id])
        @report.peer_evals = @report.user.created_peer_evals.where(:milestone => params[:milestones][:id])
        @report.group_evals = @report.user.group_evals.where(:milestone => params[:milestones][:id])
        @report_type = params[:report]
      elsif params[:report] == "groups"
        @report = Report.new
        @report.group = Team.find(params[:team][:id])
        @report.group_evals = @report.group.group_evals.where(:milestone => params[:milestones][:id]).order(:creator_id)
        @report_type = params[:report]
      end
    end
    render 'index'
  end
end
