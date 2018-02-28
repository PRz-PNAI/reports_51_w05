describe "force the signup process", :type => :feature do

  it "redirects to login" do
    visit '/reports'
    within 'h2' do
      expect(page).to have_content 'Log in'
    end
  end
end
