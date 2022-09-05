module Privileges
  extend ActiveSupport::Concern

  included do
    enum privilege: {
      user: "user",
      admin: "admin",
      superadmin: "superadmin"
    }, _prefix: :privilege

    def any_admin?
      ["admin", "superadmin"].intersection(self.class.privileges.values).include?(privilege)
    end
  end
end
