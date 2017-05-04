class WikiPolicy < ApplicationPolicy
  def new?
    user
  end

  def edit
    user
  end


  def update

  end

  def show?
    user && user == record.user || user.admin?
  end

  def destroy?
    user && record.user == user || user.admin?
  end

  class Scope
    attr_reader :user, :scope
    def initialize(user, scope)
      @user = user
      @scope= scope
    end

    def resolve
      result = []
    if user.role == 'admin'
      result = scope.all #if the user is an admin, show whem all the wikis
    elsif user.role == 'premium'
      all_wikis = scope.all
      all_wikis.each do |wiki|
        if !wiki.private? || wiki.user == user || wiki.collaborators.include?(user)
          result << wiki
        end
      end
    else
      all_wikis = scope.all
      result = []
      all_wikis.each do |wiki|
        if !wiki.private? || wiki.collaborators.include?(user)
          result << wiki
        end
      end
    end
    result
    end
  end

end
