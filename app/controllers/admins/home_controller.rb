class Admins::HomeController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def top
    @range = Date.today.all_day
    @today_order = Admin.where(created_at: @range)
  end
end
