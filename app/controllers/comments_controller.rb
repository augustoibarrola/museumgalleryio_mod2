class CommentsController < ApplicationController

    def new
    end

    def create
        @comment = Comment.create(comment_params)
        redirect_to user_art_path(@comment.user_art)
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :user_art_id)
    end
end
