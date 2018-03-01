describe Report do
  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }

  it { is_expected.to validate_length_of(:content).is_at_least(100).is_at_most(1500) }
  it { is_expected.to validate_length_of(:first_name).is_at_least(2).is_at_most(40) }
  it { is_expected.to validate_length_of(:last_name).is_at_least(3).is_at_most(40) }

  it { is_expected.not_to allow_values("asd", "asd.pl", "@asd.pl", "asd@asd").for(:email) }
  it { is_expected.to allow_values("asd@asd.pl", "asd@asd.com", "dsa@ad.com.pl").for(:email) }

  it { is_expected.not_to validate_presence_of :grade }
  it { is_expected.not_to validate_presence_of :comment }
end
