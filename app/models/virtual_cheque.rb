# frozen_string_literal: true

class VirtualCheque < ApplicationRecord
  validates :recipient_name, :amount, :date, presence: true
end
