class HomePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      true
    end
  end
  def show?
    true
  end

  def create?
    true
  end
end
