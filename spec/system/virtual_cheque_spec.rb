# frozen_string_literal: true

require 'rails_helper'

describe 'virtual cheques', type: :system do
  context 'creation' do
    scenario 'on successful creation, virtual cheque is displayed', js: true do
      visit root_path
      click_on 'New Virtual Cheque'
      fill_in 'Recipient name', with: 'Jay Jay'
      fill_in 'Amount', with: 500.05
      page.execute_script("$('#virtual_cheque_date').val('13/12/2019')")

      click_on 'Generate Virtual Cheque'

      expect(page.find('.modal')).to have_content('Five Hundred dollars and Five cents')
    end
  end

  context 'list of virtual cheques' do
    let!(:virtual_cheques) { create_list(:virtual_cheque, 5) }

    scenario do
      visit root_path
      # save_and_open_page
      expect(page.all('tbody tr').count).to eq(5)
      # expect(page).to have_content()
    end
  end
end
