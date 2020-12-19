class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id]) # クリックしたユーザーのidを探して変数@userに代入
    @plans = @user.plans
  end
end
