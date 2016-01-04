class WikiPolicy < ApplicationPolicy
  # note that user is being passed from current_user for this gem

  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || user.id == wiki.user_id
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
=begin
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
=end
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.nil?  # guest user
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !(wiki.private)
            wikis << wiki
          end
        end
      elsif user.admin?
        wikis = scope.all
      elsif user.premium?
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !(wiki.private) || wiki.user == user || wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !(wiki.private) || wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      end
      wikis ### we return this array of wikis that the user can view
    end
  end
end
