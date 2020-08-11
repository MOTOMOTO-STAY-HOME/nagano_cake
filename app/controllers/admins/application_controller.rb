class Admins::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  protect_from_forgery
end
