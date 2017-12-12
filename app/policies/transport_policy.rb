class TransportPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    return true
  end
  def new?
    true
  end
  def create?
    record.step.trip.itineraries.first.user == user
  end
  def update
    record.step.trip.itineraries.first.user == user
  end
  def destroy
    record.step.trip.itineraries.first.user == user
  end

end
