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
  user.role = "admin"
  users_all_path
  end
end
