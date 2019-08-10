class LinksController < ApplicationController
  def index
    if logged_in? 
      @links = Link.all
      render :index
      return
    end 
    redirect_to new_session_url

  end

  def new
    @link = Link.new
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
      @link = Link.new(user_id: current_user.id, title: title, url: url)
      if @link.save
        redirect_to link_url(@link)
      else
        flash[:errors] = "Url can\'t be blank" 
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
      @link = Link.find(params[:id])
      if current_user.id == @link.user_id 
        @link.title = params[:link][:title]
        old_url = @link.url
        @link.url = params[:link][:url]
        @link.url ||= old_url
        if @link.save
          redirect_to link_url(@link)
          return
        else
          flash[:errors] = "Edit Link #{@link.errors.full_messages}"
          
        end
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
