class UsersController < ApplicationController
  def index
  end

  def show
    @nickname = current_user.nickname
    @plans = current_user.plans
  end

  
end
