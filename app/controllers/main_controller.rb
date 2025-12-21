class MainController < ApplicationController
  before_action :require_login
  def index
    @user = User.first  # For testing
  end
end
