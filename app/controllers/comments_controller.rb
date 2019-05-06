class CommentsController < ApplicationController

    def create 
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        byebug
        if @comment.save 
            redirect_to lesson_path(@comment.lesson_id)
        else
            render plain: "NOOOOOOOOOO!!!!"
        end

    end

    private

    def comment_params
        params.require(:comment).permit(:lesson_id, :body)
    end
end