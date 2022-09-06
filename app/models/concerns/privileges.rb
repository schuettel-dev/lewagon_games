module Privileges
  extend ActiveSupport::Concern

  included do
    enum privilege: {
      user: "user",
      admin: "admin",
      superadmin: "superadmin"
    }, _prefix: :privilege

    def any_admin?
      %w[admin superadmin].intersection(self.class.privileges.values).include?(privilege)
    end
  end
end
