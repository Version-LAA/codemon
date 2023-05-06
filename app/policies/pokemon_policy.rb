class PokemonPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user:user)
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
