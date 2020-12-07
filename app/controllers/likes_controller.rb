class LikesController < ApplicationController
  before_action :authenticate_user!

    def create
      @plan = Plan.find(params[:plan_id])
        user = current_user
        plan = Plan.find(params[:plan_id])
        like = Like.create(user_id: user.id, plan_id: plan.id)
        redirect_to root_path
    end

    def destroy
      @plan = Plan.find(params[:plan_id])
        user = current_user
        plan = Plan.find(params[:plan_id])
        like = Like.find_by(user_id: user.id, plan_id: plan.id)
        like.delete
        redirect_to root_path
    end

    # private
    # def set_like
    #     @plan = Plan.find(params[:plan_id])
    # end
end
