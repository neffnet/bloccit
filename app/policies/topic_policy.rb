class TopicPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? && user.admin?
  # why not just user.admin? ? is user.present? redundant here?
  end

  def update?
    create?
  end
end
