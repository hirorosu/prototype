class LikesController < ApplicationController
  def create
    @like = Like.new(
        user_id: params[:student_id],
        post_id: session[:companies_id]
    )
    @like.save
    flash[:notice] = "学生をオファーしました"
    redirect_to("/students/my_page/#{@like.user_id}/show/#{@like.user_id}")
  end


end
