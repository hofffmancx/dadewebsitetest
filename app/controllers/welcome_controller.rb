class WelcomeController < ApplicationController
layout 'welcome'
  def index
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to root_path
    flash[:notice] = "成功提交留言"
  end


  private

  def comment_params
    params.require(:comment).permit(:name, :description, :tel, :email)
  end
end
