require 'features_helper'

feature "As registered user I can grade a report" do

  def open_report
    first(:link, 'Edit').click

    expect(page).to have_field 'report_comment'
    expect(page).to have_field 'report_grade'
    expect(page).to have_button 'Update Report'
  end

  include_context 'log in'

  before :each do
    Report.create first_name: 'Jan', last_name: 'Sobieski',
                  email: 'janIII@sobieski.com',
                  content: "Pobiłem Turków!"
  end

  scenario "User logs in and sees reports to grade" do
    log_in(user)
    expect(page).to have_link 'Edit'
  end

  scenario "User opens report and fills the comment" do
     log_in(user)
     open_report

     comment = "To jest komentarz automatycznego testera: #{rand}"
     within 'form' do
       fill_in 'report_comment', with: comment
     end
     click_button 'Update Report'

     expect(page).to have_content 'Report was successfully updated.'
     expect(page).to have_content comment

   end

   scenario "User opens report and fills the grade" do

     log_in(user)
     open_report

     grade = "2.0 od automatu! #{rand}"
     within 'form' do
       fill_in 'report_grade', with: grade
     end
     click_button 'Update Report'

     expect(page).to have_content 'Report was successfully updated.'
     expect(page).to have_content grade

   end
end
