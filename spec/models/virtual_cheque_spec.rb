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

      describe 'saves amount in words' do
        let(:vc) { create(:virtual_cheque, amount: 1101.09) }

        it 'has correct monetary value in words' do
          expect(virtual_cheque.amount_in_words).to eq(
            'One Thousand One Hundred and One dollars and Nine cents'
          )
        end
      end

      describe 'recipient names start with capital letters' do
        let(:vc) { create(:virtual_cheque, recipient_name: 'taylor Swift') }

        it 'saves consistently' do
          expect(virtual_cheque.recipient_name).to eq('Taylor Swift')
        end
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
