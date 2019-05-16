# frozen_string_literal: true

require 'rails_helper'

describe VirtualCheque, type: :model do
  context 'creation' do
    describe 'saves successfully' do
      let(:virtual_cheque) { create(:virtual_cheque) }

      it 'has valid credentials' do
        expect(virtual_cheque).to change { VirtualCheque.count }.by(1)
      end
    end
  end
end
