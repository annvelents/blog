class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    if  @article.comments.create(comment_params)
      @comment = @article
      redirect_to article_path(@article)
    else
      render 'create'
    end
  end
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end