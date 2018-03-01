shared_context "log in" do

  let :user do
    { email: 'asd@asd.pl', pass: 'asdqwe' }
  end

  def log_in(user)
    User.create email: user[:email], password: user[:pass]
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'Email', :with => user[:email]
      fill_in 'Password', :with => user[:pass]
    end
    click_button 'Log in'
  end
end
