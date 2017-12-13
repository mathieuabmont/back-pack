class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end


  def create?
    true
  end

  def new?
    true
  end

  def edit?
    record.step.trip.itineraries.first.user == user
  end

  def update?
    record.step.trip.itineraries.first.user == user
  end
end
