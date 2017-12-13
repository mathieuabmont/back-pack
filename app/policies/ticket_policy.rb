class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def new?
    record.transport.step.trip.itineraries.first.user == user
  end

  def create?
   record.transport.step.trip.itineraries.first.user == user
  end

  def destroy?
   record.transport.step.trip.itineraries.first.user == user
  end

  def edit?
    record.transport.step.trip.itineraries.first.user == user
  end
end
