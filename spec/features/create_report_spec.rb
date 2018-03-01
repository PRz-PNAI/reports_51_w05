require 'features_helper'

feature "As unregistered user I can add a report" do
  before :each do
    visit '/'
  end

  scenario "User fills report correctly" do
    within("form") do
      fill_in 'report_first_name', :with => 'Józef'
      fill_in 'report_last_name', :with => 'Testowy'
      fill_in 'report_email', :with => 'jozek@testowy.mail.nic'
      fill_in 'report_content', :with => 'To jest krótka treść sprawozdania'
    end
    click_button 'Create Report'

    expect(page).to have_content 'Report was successfully created.'
    expect(page).to have_content 'New Report'
  end

  scenario "User fills report incorrectly" do
    within("form") do
      fill_in 'report_first_name', :with => 'Józef'
      fill_in 'report_email', :with => 'jozek@testowy.mail.nic'
    end
    click_button 'Create Report'

    expect(page).to have_content 'errors prohibited this report from being saved'
    expect(page).to have_css 'div.field_with_errors'
  end
end
