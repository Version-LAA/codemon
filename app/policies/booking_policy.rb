class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      return scope.where(user: user)
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def edit?
    return record.user == user
  end

  def update?
    return record.user == user
  end

  def destroy?
    return record.user == user
  end

  def update_booking_status?
    return true
  end

  def cancel_booking?
    return true
  end

end
