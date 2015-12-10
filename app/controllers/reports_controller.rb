class ReportsController < ApplicationController
  def index
  end

  def create
    @report = Report.new
    @report.user = User.find(params[:user][:id])
    @report.peer_evals = @report.user.peer_evals.where(:milestone => params[:milestone])
    render 'index'
  end
end
