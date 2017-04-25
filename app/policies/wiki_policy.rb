class WikiPolicy < ApplicationPolicy
  def new?
    user
  end

  def edit
    user
  end


  def update

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
      scope.all.each do |wiki|
        if user.admin? || user == wiki.user
          result << wiki
        else unless wiki.private?
          result << wiki
        end
      end
    end
    result
    end
  end

end
