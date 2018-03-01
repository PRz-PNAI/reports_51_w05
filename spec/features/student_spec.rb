require 'features_helper'

describe "default page", :type => :feature do
  before :each do
    visit '/'
  end
  subject { page }

  it{ should have_field('report_first_name') }
  it{ should have_field('report_last_name') }
  it{ should have_field('report_email') }
  it{ should have_field('report_content') }
  it{ should have_button('Create Report') }

end
