require 'features_helper'

describe "the signup process", :type => :feature do
  include_context 'log in'

  subject { page }
  it{ should have_content 'Signed in successfully' }
  it{ should have_content 'Reports' }
  it{ should have_link 'Log out' }
end
