# Feature: Sign out
#   As a user
#   I want to sign out
#   So I can protect my account from unauthorized access
RSpec.feature 'Sign out', :devise do
  before(:each) do
    ActionController::Base.allow_forgery_protection = false
  end

  after(:each) do
    ActionController::Base.allow_forgery_protection = true
  end

  # Scenario: User signs out successfully
  #   Given I am signed in
  #   When I sign out
  #   Then I see a signed out message
  scenario 'user signs out successfully' do
    user = FactoryGirl.create(:registered_user)
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
    click_link 'Sign out'
    expect(page).to have_content I18n.t 'devise.sessions.signed_out'
  end
end
