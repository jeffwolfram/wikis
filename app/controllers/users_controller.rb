class UsersController < ApplicationController
  def down_grade
    user = User.find params[:id]
    user.update(:standard => true)
  end
end
