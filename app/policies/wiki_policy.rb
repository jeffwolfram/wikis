class WikiPolicy < ApplicationPolicy
  def new?
    user.present?
  end
end
