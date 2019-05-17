# frozen_string_literal: true

require 'humanize'

class VirtualCheque < ApplicationRecord
  before_save :capitalize_names
  after_create :update_amount_in_words

  validates :recipient_name, :amount, :date, presence: true

  scope :filter_by_name, -> (rn) { where(recipient_name: rn) }

  private

  def capitalize_names
    self.recipient_name = recipient_name.titleize
  end

  def update_amount_in_words
    self.amount_in_words = translate_amount_to_words
    save
  end

  def translate_amount_to_words
    amn = amount.to_s.split('.')
    amn.map.with_index do |n, i|
      dollar_words = amn[1].to_i > 0 ? ' dollars and': ' dollars'
      # checks for unnecessary zeros and removes them
      # capitalizes all words apart from 'and'
      n.sub!(/^0*/, '').to_i > 0 && (n.to_i.humanize.delete(',').titleize.gsub('And', 'and') +
        (i == 0 ? dollar_words : ' cents')) || ''
    end.join('')
  end
end
