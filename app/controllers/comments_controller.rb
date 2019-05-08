class CommentsController < ApplicationController

    def create 
            @comment = Comment.new(comment_params)
            @comment.user_id = current_user.id
            @comment.save 
                redirect_to lesson_path(@comment.lesson_id)

    end

    private

    def comment_params
        params.require(:comment).permit(:lesson_id, :body)
    end
end