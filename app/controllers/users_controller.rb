class UsersController < ActionController::Base

  # registration
  def create
    @user = User.new(password: params[:password], name: params[:username])
    @user.save
    redirect_to @user
  end

  # post login
  def show
    @username = User.find(params[:id]).name
  end

  # registration form
  def new

  end

  def mypage
    @username = 'world'
  end
end
