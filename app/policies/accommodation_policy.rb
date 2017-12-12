class AccommodationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def show?
    return true
  end

  def new?
    record.step.trip.itineraries.first.user == user
  end
  def create?
    record.step.trip.itineraries.first.user == user
  end

  def edit?
    record.step.trip.itineraries.first.user == user
  end

  def update?
    record.step.trip.itineraries.first.user == user
  end

  def destroy?
    record.step.trip.itineraries.first.user == user
  end
end
