class Admins::ApplicationControllerController < ApplicationController
  before_action :authenticate_admin!
end
