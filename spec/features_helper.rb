email = 'asd@asd.pl'
pass = 'asdqwe'

shared_context "log in" do
  before :each do
    User.create email: email, password: pass
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', :with => email
      fill_in 'Password', :with => pass
    end
    click_button 'Log in'
  end
end
