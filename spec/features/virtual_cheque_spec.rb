# frozen_string_literal: true

require 'rails_helper'

describe 'virtual cheques', type: :feature do
  context 'creation' do
    scenario 'on successful creation, virtual cheque is displayed' do
      visit root_path
      click_on 'New Virtual Cheque'

      fill_in 'Recipient name', with: 'Jay Jay'
      fill_in 'Amount', with: 500.05
      page.execute_script("$('#virtual_cheque_date').val('12/12/2019')")

      click_on 'Generate Virtual Cheque'

      expect(page.find('.modal')).to have_content('Five Hundred dollars and Five cents')
    end
  end
end
