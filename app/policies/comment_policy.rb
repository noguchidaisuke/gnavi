class CommentPolicy < ApplicationPolicy
  def update?
    user.id === record.user_id
  end

  def destroy?
    update?
  end

  def remove_image?
    update?
  end
end
