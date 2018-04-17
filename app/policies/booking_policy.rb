class BookingPolicy < ApplicationPolicy

  # def index?
  #   # scope.where(user: user)
  # end

  def show?
    true
    # scope.where(user: user)
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
