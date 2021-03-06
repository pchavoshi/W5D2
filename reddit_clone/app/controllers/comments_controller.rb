class CommentsController < ApplicationController

  def new 
    @post_id = params[:post_id]  
  end 
  
  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = @comment.errors.full_messages 
      redirect_to post_url(params[:post_id])
    end 
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  
  private 
  def comment_params 
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end 
end
