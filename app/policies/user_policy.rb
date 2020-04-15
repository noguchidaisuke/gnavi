class UserPolicy < ApplicationPolicy
  def update?
    user.id === record.id
  end

  def destroy?
    update?
  end
end
