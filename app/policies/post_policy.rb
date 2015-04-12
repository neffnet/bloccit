class PostPolicy < ApplicationPolicy

  class Scope
    attr_reader :user, :scope
    def initialize(user,scope)
      @user = user
      @scope = scope
    end

    def resolve
      if !user.present?
        scope.where('1=2')
        # what's the "right" way to do that?
      elsif user.admin? || user.moderator?
        scope.all
      else
        scope.where(:user => user)
      end
    end
  end

  def index?
    true
  end
end
