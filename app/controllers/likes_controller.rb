class LikesController < ApplicationController
  def create
    @log = Log.find(params[:log_id])
    @like = Like.new(like_params)
    if @like.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @like = Like.find_by(log_id: params[:log_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private
    def like_params
      params.require(:like).permit(:log_id, :user_id)
    end
end
