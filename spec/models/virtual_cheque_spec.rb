# frozen_string_literal: true

require 'rails_helper'

describe VirtualCheque, type: :model do
  context 'creation' do
    let(:virtual_cheque) { vc }

    describe 'saves successfully' do
      let(:vc) { create(:virtual_cheque) }

      it 'has valid input' do
        expect { virtual_cheque }.to change { VirtualCheque.count }.by(1)
      end
    end

    describe 'does not save' do
      let(:vc) { create(:virtual_cheque, date: nil) }

      it 'has missing input' do
        expect { virtual_cheque }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
