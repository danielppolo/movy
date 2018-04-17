class BikePolicy < ApplicationPolicy

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def toggle?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
