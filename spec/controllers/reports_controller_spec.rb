describe ReportsController do
  # https://github.com/thoughtbot/shoulda-matchers/blob/v2.8.0/lib/shoulda/matchers/action_controller/strong_parameters_matcher.rb
  pending "permit specs for #create/#update using shoulda for logged in user"
  context "With user not logged in" do
    let(:params) do
      {
        report: attributes_for(:report)
      }
    end

    it "allows to fill report fields" do
      puts params
      is_expected.to permit(:first_name, :last_name, :email, :content).
        for(:create, params: params).on(:report)
    end

    it "does not allow to grade report" do
      is_expected.not_to permit(:grade).
        for(:create, params: params).on(:report)
    end

    it "does not allow to comment report" do
      is_expected.not_to permit(:comment).
        for(:create, params: params).on(:report)
    end

  end
end
