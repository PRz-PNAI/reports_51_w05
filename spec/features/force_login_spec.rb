describe "force the signup process", :type => :feature do

  it "should redirect to login" do
    visit '/reports'
    within 'h2' do
      page.should have_content 'Log in'
    end
  end
end
