class LikesController < ApplicationController
  
   def create 
     @like = current_user.likes.build(like_params)
     @like.save 
     redirect_to posts_path ,notice: "create like"
   end
        def destroy
          @like= current_user.likes.find(params[:id])
          @like.destroy
          redirect_to posts_path, notice: "unlike comment"
        end
  private     
  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type, :user_id)
  end
end

