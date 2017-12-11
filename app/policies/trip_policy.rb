class TripPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    record.itineraries.first.user == user
  end


  def destroy?
    record.itineraries.first.user == user
  end
end
