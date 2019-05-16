# frozen_string_literal: true

class VirtualChequesController < ApplicationController
  def index
    @virtual_cheque = VirtualCheque.new
  end
end
