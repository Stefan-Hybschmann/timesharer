class OwnershipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    # inside policy we have access to record, which is the ownership we're examining.
    # we also have access to the current_user, which is called user
    # If you're an admin for this home, you can update other owners' 'shares_of_ownership'

    # Step 1 is current user and owner of the home? - line 15 & 16
    # Step 2 is the current user and admin of the home? - line 17
    current_user_ownership = Ownership.find_by(user: user, home: record.home)
    return false if current_user_ownership.nil?
    return current_user_ownership.is_admin
  end
end
