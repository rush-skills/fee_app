class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

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

   def rails_admin?(action)
    case action
      when :dashboard
        if user.role.admin? or user.role.user?
          true
        else
          redirect_to '/'
        end
      when :index
        user.role.admin? or user.role.user?
      when :show
        user.role.admin? or user.role.user?
      when :new
        user.role.admin? or user.role.user?
      when :edit
        user.role.admin?
      when :destroy
        user.role.admin?
      when :export
        user.role.admin?
      when :history
        user.role.admin?
      when :show_in_app
        user.role.admin? or user.role.user?
      else
        redirect_to '/admin'
    end
  end

end

