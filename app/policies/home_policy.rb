class HomePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      true
    end
    def show?
      true
    end

    def create?
      true
    end
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
