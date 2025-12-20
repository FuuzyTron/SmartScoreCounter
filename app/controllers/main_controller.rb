class MainController < ApplicationController
  def index
    @user = User.first  # For testing
  end
end
