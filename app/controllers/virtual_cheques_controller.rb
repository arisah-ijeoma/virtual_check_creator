# frozen_string_literal: true

class VirtualChequesController < ApplicationController
  def index
    @virtual_cheque = VirtualCheque.new
    @virtual_cheques = VirtualCheque.all
  end

  def new
    @virtual_cheque = VirtualCheque.new
  end

  def create
    @virtual_cheque = VirtualCheque.new(virtual_cheque_params)

    if @virtual_cheque.save
      respond_to do |format|
        format.js {  }
      end
    else
    end
  end

  def show
    @virtual_cheque = VirtualCheque.find_by(id: params[:id])
  end

  def filter
    @virtual_cheques = VirtualCheque.filter_by_name(params[:recipient_name])
  end

  private

  def virtual_cheque_params
    params.require(:virtual_cheque).permit(:recipient_name, :date, :amount, :amount_in_words)
  end
end
