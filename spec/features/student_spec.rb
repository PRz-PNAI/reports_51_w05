require 'features_helper'

feature "As unregistered user I get report form on default page" do
  scenario "User enters / and sees report form" do
    visit '/'

    expect(page).to have_field('report_first_name')
    expect(page).to have_field('report_last_name')
    expect(page).to have_field('report_email')
    expect(page).to have_field('report_content')
    expect(page).to have_button('Create Report')
  end
end
