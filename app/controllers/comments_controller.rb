class CommentsController < ApplicationController
	
	def create
		@comment = current_user.comments.new(comment_params)

		if @comment.save
			redirect_to posts_path
		else
			render :new
		end	
    end
    private
    def comment_params
		#byebug
		params.require(:comment).permit(:commenter, :post_id)
		
	end
end