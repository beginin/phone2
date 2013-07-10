class ReportsController < ApplicationController
  def report1
  	@report1 = Report.report1(params[:id])
  end
end