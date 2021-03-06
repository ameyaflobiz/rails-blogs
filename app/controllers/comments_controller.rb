class CommentsController < ApplicationController

    def index
        @comments= Article.all
    end
    def create
        @article= Article.find(params[:article_id])
        @comment= @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end
    def show
        @comment= Article.find(params[:article_id]).comments.find(params[:id])
    end
    def destroy
        # print( params.require(:comments))
        @article=Article.find(params[:article_id])
        @comment= @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter,:body)
    end
end
