class PostPolicy < ApplicationPolicy

    def create?
        user.admin_role? || user.full_role? || user.baby_role? || user.observer_role?
    end

    def update?
        user.admin_role? || user.author?(record)
    end

    def destroy?
        user.admin_role? || user.author?(record)
    end

    def index?
        true
    end

    def show?
        true
    end
end