# frozen_string_literal: true

require 'humanize'

class VirtualCheque < ApplicationRecord
  before_save :capitalize_names
  after_save :add_amount_in_words

  validates :recipient_name, :amount, :date, presence: true

  private

  def capitalize_names
    # 'and' has an exception for the titleize method in #add_amount_in_words
    # we'll be using capitalize instead in case we have a recipient with 'And'
    # as a name
    self.recipient_name = recipient_name.split.map(&:capitalize).join(' ')
  end

  def add_amount_in_words
    amounts = amount.to_s.split('.').map do |d|
      d.sub!(/^0*/, '').to_i.humanize.delete(',').titleize
    end

    amount_in_words = "#{amounts[0]} dollars and #{amounts[1]} cents"
    self.amount_in_words = amount_in_words
  end
end
