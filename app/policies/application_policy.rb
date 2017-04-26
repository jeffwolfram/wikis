class ApplicationPolicy
  attr_reader :user, :record, :collaborators

  def initialize(user, record, collaborators )
    @user = user
    @record = record
    @collaborators = collaborators
  end

  def index?
    resolve
  end

  def show?
    !record.private? || user.present? && (user.admin? || record.user == user)
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update? #does this mean that it follows same rule as update?
  end

  def destroy?
    user.present? || user && user.admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end



end
