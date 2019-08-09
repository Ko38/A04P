class LinksController < ApplicationController
  def index
    if logged_in? 
      render :index
      return
    end 
    redirect_to new_session_url

  end

  def new
    if logged_in?
      render :new
      return
    end
    
    redirect_to new_session_url
  end

  def create
    if logged_in?

      title = params[:link][:title]
      url = params[:link][:url]
      if title && url
        link = Link.new(user_id: current_user.id, title: title, url: url)
        link.save!
        redirect_to link_url(link)
      else
        flash[:errors] = "oh no" 
        render :new
      end
      return
    end

    redirect_to new_session_url
  end

  def destroy 

  end

  def show
    if logged_in? 
      @link = Link.find(params[:id])

      render :show
      return
    end 
    redirect_to new_session_url
  end

  def edit 
    if logged_in? 
      @link = Link.find(params[:id])

      render :edit
      return
    end 
    redirect_to new_session_url
  end

  def update
    if logged_in? 
      link = Link.find(params[:id])
      if current_user.id == link.user_id 
        link.title = params[:link][:title]
        link.save!
      end
      render :edit
      return
    end 
    redirect_to new_session_url
  end

  private 

  # def link_params 
  #   params.require(:link).permit(:title, :url)
  # end
end
