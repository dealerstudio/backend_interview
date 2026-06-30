# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :dealership

  STATUSES = %w[available sold].freeze
end
