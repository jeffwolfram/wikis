class WikiPolicy < ApplicationPolicy
  attr_reader :current_user, :model
  def initialize(current_user, model)
    @current_user = current_user
    @wiki = model
  end

  def new?
    current_user
  end
  def edit
    current_user
  end
  def update
    

  end
  def destroy
    @current_user.admin
  end
end