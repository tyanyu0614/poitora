class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
    redirect_to plan_path(@comment.plan)  # コメントと結びつく旅行記事の詳細画面に遷移する
    else
    @plan = @comment.plan
    @comments = @plan.comments
    render:"prototypes/show"
  end
end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, plan_id: params[:plan_id])
  end
end
