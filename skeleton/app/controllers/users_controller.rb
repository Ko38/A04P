class UsersController < ApplicationController
  def index 
    render :index
  end
  
  def new 
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to links_url
    else
      flash[:errors] = "oh no"
      render :new
    end
  end

  def show 

  end

  private 

  def user_params
    params.require(:user).permit(:username,:password)
  end
end
