class PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plans, only: [:show, :edit]
  before_action :baria_user, only: [:destroy, :edit, :update]
  before_action :search_plan, only: [:index, :search]

  def index
    @plan = Plan.includes(:user).order('created_at DESC')
    @user = User.find_by(id: params[:follow_id])
    set_plan_column       # privateメソッド内で定義
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
    @comments = @plan.comments.includes(:user) # includesメソッドを使って、N+1問題を解決
  end

  def search
    @plan = Plan.search(params[:keyword])
    @results = @p.result.includes(:category) # 検索条件にマッチした商品の情報を取得
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

  def plan_params
    params.require(:plan).permit(:title, :content, :cost, :image, :category_id).merge(user_id: current_user.id)
  end

  def set_plans
    @plan = Plan.find(params[:id])
  end

  def baria_user
    @plan = Plan.find(params[:id])
    redirect_to plans_path unless current_user == @plan.user
  end

  def search_plan
    @p = Plan.ransack(params[:q]) # 検索オブジェクトを生成
  end

  def set_plan_column
    @plan_category_id = Plan.select('category_id').distinct  # 重複なくnameカラムのデータを取り出す
  end
end
