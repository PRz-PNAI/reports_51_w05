describe ReportsController do

  context "With user not logged in" do

    let(:params) do
      {
        report: attributes_for(:report)
      }
    end

    it "allows to fill report fields" do
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

  context "With user logged in" do
    include Warden::Test::Helpers

    before(:each) { sign_in(user, scope: :user) }

    let(:user) { create(:user) }
    let(:report) { create(:report, :comment, :grade) }
    let(:params) do
      {
        report: report.attributes,
        id: report.id
      }
    end

    it "allows to grade and comment report" do
      is_expected.to permit(:grade, :comment).
        for(:update, params: params).on(:report)
    end

    it "does not allow to change contents or autor data" do
      aggregate_failures "not allowed fields" do
        [ :first_name, :last_name, :email, :content ].each do |field|
          is_expected.not_to permit(field).
            for(:update, params: params).on(:report)
        end
      end
    end
  end
end
