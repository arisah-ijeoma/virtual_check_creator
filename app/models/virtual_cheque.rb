# frozen_string_literal: true

require 'humanize'

class VirtualCheque < ApplicationRecord
  before_save :capitalize_names
  after_save :add_amount_in_words

  validates :recipient_name, :amount, :date, presence: true

  private

  def capitalize_names
    self.recipient_name = recipient_name.titleize
  end

  def add_amount_in_words
    amounts = amount.to_s.split('.').map do |d|
      d.sub!(/^0*/, '').to_i.humanize.delete(',').titleize.gsub('And', 'and')
    end

    self.amount_in_words = "#{amounts[0]} dollars and #{amounts[1]} cents"
  end
end
