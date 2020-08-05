class Admins::HomeController < ApplicationController
  def top
    @range = Date.today.all_day
    @today_order =Order.where(created_at: @range)
  end
end
