describe "creating new report", :type => :feature do
  before :each do
    visit '/'
  end

  describe "correctly filled" do
    before :each do
      within("form") do
        fill_in 'report_first_name', :with => 'Józef'
        fill_in 'report_last_name', :with => 'Testowy'
        fill_in 'report_email', :with => 'jozek@testowy.mail.nic'
        fill_in 'report_content', :with => 'To jest krótka treść sprawozdania'
      end
      click_button 'Create Report'
    end

    subject { page }
    it{ should have_content 'Report was successfully created.' }
    it{ should have_content 'New Report' }
  end

  describe "incorrectly filled" do
    before :each do
      within("form") do
        fill_in 'report_first_name', :with => 'Józef'
        fill_in 'report_email', :with => 'jozek@testowy.mail.nic'
      end
      click_button 'Create Report'
    end
    subject { page }
    it{ should have_content 'errors prohibited this report from being saved' }
    it{ should have_css 'div.field_with_errors' }
  end
end
