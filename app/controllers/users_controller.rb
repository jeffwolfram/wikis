class UsersController < ApplicationController
  before_action :admin_check, only: [:index]

  def downgrade
    unless current_user.standard?
    current_user.standard!
    current_user.wikis.where(private: true).update_all(private: false)
    redirect_to root_path
    end
  end

  def index
    @users = User.all

  end

  def show
    @user = User.find params[:id]
    @wikis = @user.wikis.visible_to(current_user)
  end

  def make_admin
    if current_user.role == "admin"
    user = User.find params[:id]
    user.admin!
    redirect_to users_all_path

    end
  end

  def make_standard
    if current_user.role == "admin"
    user = User.find params[:id]
    user.standard!
    redirect_to users_all_path
    end
  end

  def make_premium
    if current_user.role == "admin"
    user = User.find params[:id]
    user.premium!
    redirect_to users_all_path
    end
  end

  private
  def admin_check
    unless current_user.admin?
      redirect_to root_path, notice: "Thou shalt not pass!"
    end
  end


end
