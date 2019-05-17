# frozen_string_literal: true

class VirtualChequesController < ApplicationController
  def index
    @virtual_cheque = VirtualCheque.new
    @virtual_cheques = VirtualCheque.all
  end

  def new
    @virtual_cheque = VirtualCheque.new
  end
end
