class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    @user = user
    if user
      login(user)
      redirect_to links_url
    else
      flash[:errors] = "oh no"
      render :new
    end
  end


  def destroy
    logout(@user)
  end

  private 

  def user_params
    params.require(:user).permit(:username,:password)
  end
end
