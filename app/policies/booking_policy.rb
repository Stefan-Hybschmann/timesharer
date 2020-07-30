class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def pending?
    record.user == user
  end

  def approve?
    true
  end

  def reject?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
