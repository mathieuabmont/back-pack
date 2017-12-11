class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end

  def index?
    true
  end

  def create?
    record.step.trip.itineraries.first.user == user
  end

  def new?
    record.step.trip.itineraries.first.user == user
  end

  def edit?
    record.step.trip.itineraries.first.user == user
  end

  def update?
    record.step.trip.itineraries.first.user == user
  end
end
