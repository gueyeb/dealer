require 'rails_helper'

RSpec.feature "Contacts", type: :feature do
  scenario "Filling in the contact form" do
    visit 'contacts/new'
    
  end
end
