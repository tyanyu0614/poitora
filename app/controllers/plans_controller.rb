class PlansController < ApplicationController
  before_action :authenticate_user!, except:[:show]
  before_action :set_plans, only: [:show,:edit,]
  before_action :baria_user, only: [:destroy,:edit,:update]
  

  def index
    @plan = Plan.includes(:user).order("created_at DESC")
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
    @comment = Comment.new
    @comments = @plan.comments.includes(:user) #includesメソッドを使って、N+1問題を解決している
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
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to plans_path
    else
      render :edit
    end
  end

  private

  #後でアクティブハッシュでカテゴリーも追加する。
  def plan_params
    params.require(:plan).permit(:title, :content, :cost,:image).merge(user_id: current_user.id)
  end
  
  def set_plans
    @plan = Plan.find(params[:id])
  end

  def baria_user
    @plan = Plan.find(params[:id])
    unless current_user == @plan.user
    redirect_to plans_path 
    end
  end

end

