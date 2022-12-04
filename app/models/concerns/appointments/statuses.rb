module Appointments
  module Statuses
    STATUSES = [
      STATUS_ACTIVE = 'active',
      STATUS_INACTIVE = 'inactive'
    ].freeze

    STATUSES_HUMANIZED = {
      STATUS_ACTIVE => 'Active',
      STATUS_INACTIVE => 'Inactive'
    }.freeze

    def self.options_for_enum
      STATUSES.to_h { |i| [i, i] }
    end
  end
end
