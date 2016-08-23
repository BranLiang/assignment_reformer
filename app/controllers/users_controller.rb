class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user = User.new( :username => params[:username],
    #                   :email => params[:email],
    #                   :password => params[:password] )
    @user = User.new(white_list_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(:id)
  end

  def white_list_params
    params.require(:user).permit(:username, :email, :password)
  end
end
