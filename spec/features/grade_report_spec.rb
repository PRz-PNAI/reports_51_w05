describe "grading report process", :type => :feature do
  before :each do
    Report.create first_name: 'Jan', last_name: 'Sobieski',
                  email: 'janIII@sobieski.com',
                  content: "Pobiłem Turków!"
  end

  include_context 'log in'

  subject { page }

  it { should have_link 'Edit' }

  describe "open report" do
    before :each do
      first(:link, 'Edit').click
    end

    subject { page }

    it { should have_field 'report_comment' }
    it { should have_field 'report_grade' }
    it { should have_button 'Update Report' }

    describe "should save comment" do
      before :each do
        within 'form' do
          fill_in 'report_comment', with: comment
        end
        click_button 'Update Report'
      end
      let(:comment){"To jest komentarz automatycznego testera: #{rand}"}
      subject { page }

      it { should have_content 'Report was successfully updated.' }
      it { should have_content comment }

   end

   describe "should save grade" do
     before :each do
       within 'form' do
         fill_in 'report_grade', with: grade
       end
       click_button 'Update Report'
     end
     let(:grade){"2.0 od automatu! #{rand}"}
     subject { page }

     it { should have_content 'Report was successfully updated.' }
     it { should have_content grade }

   end
  end
end
