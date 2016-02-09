class Admin::DashboardController < ApplicationController
	before_action :authenticate_user!
  def index
  	@admin = true
  end
end
