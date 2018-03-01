require 'features_helper'

feature "As unregistered user I cannot access reports" do

  scenario "User enters reports list and is redirected to login page" do
    visit '/reports'
    within 'h2' do
      expect(page).to have_content 'Log in'
    end
  end
end
