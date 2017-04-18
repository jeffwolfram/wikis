class WikiPolicy < ApplicationPolicy
  def new?
    user.present?
  end
  def edit
    current_user?
  end
end
