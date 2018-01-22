class UsersController < ApplicationController
  def index
  end
  def about
  end
  def show1
  end
  def show2
  end
  def show3
  end
  def show4
  end

  def select
    @users = User.all
  end
  def detail
    @users = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(name: params[:name], email: params[:email])
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
end
