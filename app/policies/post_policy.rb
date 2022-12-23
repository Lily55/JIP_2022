class PostPolicy < ApplicationPolicy

    def create?
    end

    def update?
    end

    def destroy?
    end

    def index?
        true
    end

    def show?
        true
    end
end