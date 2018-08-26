class LikeController < ApplicationController
  def create
    @like = Like.find_or_initialize_by(quiz_id: params[:id])
    @like.like_count = likes_params[:value]
    @like.save!
  end

  private

  def likes_params
    params.require(:like).permit(:value)
  end
end
