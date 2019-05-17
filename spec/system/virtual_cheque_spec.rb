# frozen_string_literal: true

require 'rails_helper'

describe 'virtual cheques', type: :system, js: true do
  context 'creation' do
    scenario 'on successful creation, virtual cheque info is displayed correctly' do
      visit root_path
      click_on 'New Virtual Cheque'
      fill_in 'Recipient name', with: 'Jay Jay'
      fill_in 'Amount', with: 500.05
      page.execute_script("$('#virtual_cheque_date').val('13/12/2019')")

      click_on 'Generate Virtual Cheque'

      expect(page.find('.modal')).to have_content('$500.05')
      expect(page.find('.modal')).to have_content('Five Hundred dollars and Five cents')
    end
  end

  context 'virtual cheques' do
    let!(:vc1) { create_list(:virtual_cheque, 2) }
    let!(:vc2) { create_list(:virtual_cheque, 3, recipient_name: 'Jay') }
    let!(:virtual_cheques) { [vc1, vc2] }

    scenario 'view list of virtual cheques' do
      visit root_path
      expect(page.all('tbody tr').count).to eq(5)
    end

    scenario 'filter by recipient name' do
      visit root_path
      click_link('Jay', match: :first)

      expect(page).to have_link('Clear filter')
      expect(page.all('tbody tr').count).to eq(3)
    end

    scenario 'clearing filter returns full list' do
      visit root_path
      click_link('Jay', match: :first)

      click_on 'Clear filter'
      expect(page).not_to have_link('Clear filter')
      expect(page.all('tbody tr').count).to eq(5)
    end
  end

  context 'shows virtual cheque details' do
    let!(:virtual_cheque) { create(:virtual_cheque, amount: 300) }

    scenario do
      visit root_path
      page.find("a[href='/virtual_cheques/#{virtual_cheque.id}']").click

      within "#edit_virtual_cheque_#{virtual_cheque.id}" do
        expect(page).to have_content('Three Hundred dollars')
      end
    end
  end
end
