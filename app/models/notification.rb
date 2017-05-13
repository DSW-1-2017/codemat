class Notification < ApplicationRecord
  scope :only_active, -> { where(active: true) }
end
