# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :dealership

  STATUSES = %w[available sold].freeze

  # BUG: missing validates :make, :model, presence: true
  # BUG: missing validates :vin, uniqueness: true
end
