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

      context 'saves amount in words' do
        describe 'does not add zero in front of cents' do
          let(:vc) { create(:virtual_cheque, amount: 1101.09) }

          it 'has correct monetary value in words' do
            expect(virtual_cheque.amount_in_words).to eq(
              'One Thousand One Hundred and One dollars and Nine cents'
            )
          end
        end

        describe 'does not have zero as a word when there are no cents' do
          let(:vc) { create(:virtual_cheque, amount: 245) }

          it 'has correct monetary value in words' do
            expect(virtual_cheque.amount_in_words).to eq(
              'Two Hundred and Forty Five dollars'
            )
          end
        end

        describe 'does not have zero as a word when there are no dollars' do
          let(:vc) { create(:virtual_cheque, amount: 0.50) }

          it 'has correct monetary value in words' do
            expect(virtual_cheque.amount_in_words).to eq('Fifty cents')
          end
        end
      end

      describe 'recipient names start with capital letters' do
        let(:vc) { create(:virtual_cheque, recipient_name: 'taylor Swift and') }

        it 'saves consistently' do
          expect(virtual_cheque.recipient_name).to eq('Taylor Swift And')
        end
      end

      describe 'cents are two digits' do
        let(:vc) { create(:virtual_cheque, amount: 12.345) }

        it 'saves cents as two digits' do
          expect(virtual_cheque.amount).to eq(12.35)
          expect(virtual_cheque.amount_in_words).to eq(
            'Twelve dollars and Thirty Five cents'
          )
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
