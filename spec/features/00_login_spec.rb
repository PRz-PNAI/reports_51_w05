require 'features_helper'

feature "As registered user I can log in" do

  include_context 'log in'

  scenario "User logs in correctly" do

    log_in(user)

    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_content 'Reports'
    expect(page).to have_link 'Log out'

  end
end
