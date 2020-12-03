class PlansController < ApplicationController
  def index
    @plan = Plan.includes(:user).order("created_at DESC")
    # @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to plans_path
    else
      render :new
    end
  end

  private
  #プライベートメソッド

  #後でアクティブハッシュでカテゴリーも追加する。
  def plan_params
    params.require(:plan).permit(:title, :content, :cost,:image).merge(user_id: current_user.id)
  end
  
end

