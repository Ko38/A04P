class CommentsController < ApplicationController
  def create
    if logged_in?
      comment_body = params[:comment][:body]
      link_id = params[:link_id]
      link = Link.find_by(id: link_id)
      if comment_body == ""
        flash[:errors] = "Body can\'t be blank"
        redirect_to link_url(link)
        return
      end
      comment = Comment.new(body: comment_body, user_id: current_user.id, link_id: link_id)
      comment.save!

      redirect_to link_url(link)
      return
    end
    redirect_to new_session_url
  end 

  def destroy
    if logged_in?
      comment = Comment.find_by(id: params[:id])
      link = Link.find_by(id: comment.link_id)
      comment.destroy
      redirect_to link_url(link)
      return 
    end
    redirect_to new_session_url

  end
end
