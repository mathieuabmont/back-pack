class StepPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def index?
    return true
  end
  def create?
    record.trip.itineraries.first.user == user
  end
  def update?
    record.trip.itineraries.first.user == user
  end
  def destroy?
    record.trip.itineraries.first.user == user
  end
  def new?
    true
  end
end
