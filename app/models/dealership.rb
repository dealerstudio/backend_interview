# frozen_string_literal: true

class Dealership < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :users, dependent: :destroy

  scope :active, -> { where(active: true) }

  # BUG: missing validates :slug, uniqueness: true
end
