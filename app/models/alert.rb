class Alert < ApplicationRecord
  VALID_TYPES = %w[PortalOpened PortalClosed].freeze

  validates :description, presence: true
  validates :origin, presence: true
  validates :type, presence: true
  validates :tag, presence: true
  validates :type, inclusion: { in: VALID_TYPES }
end
