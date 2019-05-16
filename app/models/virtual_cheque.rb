# frozen_string_literal: true

require 'humanize'

class VirtualCheque < ApplicationRecord
  after_save :add_amount_in_words

  validates :recipient_name, :amount, :date, presence: true

  private

  def add_amount_in_words
    amounts = amount.to_s.split('.').map do |d|
      d.sub!(/^0*/, '').to_i.humanize.delete(',').titleize
    end

    amount_in_words = "#{amounts[0]} dollars and #{amounts[1]} cents"
    self.amount_in_words = amount_in_words
  end
end
