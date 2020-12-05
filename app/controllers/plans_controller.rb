class PlansController < ApplicationController
  # before_action :set_plans, only: [:index,:create,]

  def index
    @plan = Plan.includes(:user).order("created_at DESC")
    # @plan = Plan.all
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

  def show
    @plan = Plan.find(params[:id])
  end

  def search
    @plan = Plan.search(params[:keyword])
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to plans_path
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    if plan.update(plan_params)
      redirect_to plans_path
    else
      render :edit
    end
  end

  private
  #プライベートメソッド

  #後でアクティブハッシュでカテゴリーも追加する。
  def plan_params
    params.require(:plan).permit(:title, :content, :cost,:image).merge(user_id: current_user.id)
  end
  
  # def set_plans
  # end

end

