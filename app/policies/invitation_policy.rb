class InvitationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def join?
    true
  end

  def create?
    true
  end

end
