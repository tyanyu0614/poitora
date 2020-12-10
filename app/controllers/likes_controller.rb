class LikesController < ApplicationController
    before_action :set_like
  

    def create
        Like.create(user_id: current_user.id, plan_id: params[:id])
        @plan.reload
        
    end

    def destroy
        Like.find_by(user_id: current_user.id, plan_id: params[:id]).destroy
        @plan.reload
      end

    private

    def set_like
        @plan = Plan.find(params[:id])
    end

end
