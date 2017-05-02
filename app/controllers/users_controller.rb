class UsersController < ApplicationController

  def down_grade
    user = User.find params[:id]
    user.update(:standard => true)
  end

  def index
    @users = User.all
  end

  def make_admin
    user = User.find params[:id]
    user.admin!
    redirect_to users_all_path
  end

  def make_standard
    user = User.find params[:id]
    user.standard!
    redirect_to users_all_path
  end

  def make_premium
    user = User.find params[:id]
    user.premium!
    redirect_to users_all_path
  end

end
