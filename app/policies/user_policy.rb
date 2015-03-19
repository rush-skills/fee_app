class UserPolicy < ApplicationPolicy
  def rails_admin?(action)
    case action
      when :dashboard
        user.role.admin?
      when :index
        user.role.admin?
      when :show
        user.role.admin?
      when :new
        user.role.admin?
      when :edit
        user.role.admin?
      when :destroy
        user.role.admin?
      when :export
        user.role.admin?
      when :history
        user.role.admin?
      when :show_in_app
        user.role.admin?
      else
        super
    end
  end
end