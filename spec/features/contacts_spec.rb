require 'rails_helper'

RSpec.feature 'Contacts', type: :feature do
  scenario 'Filling in the contact form' do
    visit '/contacts/new'
    expect(page).to have_content 'For more information contact Tucker.'
    expect(page).to have_content '303-304-1081'

    within('#new_contact') do
      fill_in 'Name', with: 'John Doe'
      fill_in 'Email', with: 'john@doe.com'
      fill_in 'Subject', with: 'Buy a car'
      fill_in 'Message', with: 'I want to buy your most expensive car'
    end
    click_button 'Submit'
    expect(page).to have_content 'Your message has been sent.'
  end
end
