class ReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def create
    if current_user.admin 
      @report = Report.new
      @report.user = User.find(params[:user][:id])
      @report.peer_evals = @report.user.peer_evals.where(:milestone => params[:milestone])
    end
    render 'index'
  end
end
