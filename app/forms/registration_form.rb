class RegistrationForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :title, :topic, :email, :password, :password_confirmation

  validates :first_name, :last_name, :title, :topic, :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true

  def self.model_name
    ActiveModel::Name.new(self, nil, "Registration")
  end

  def valid?
    validate
    [ user_model, topic_model ].each do |o|
      o.validate
      o.errors.each { |field, error| errors.add field, error }
    end
    errors.empty?
  end

  private

  def user_model
    @user ||= User.new  title: title,
                        first_name: first_name,
                        last_name: last_name,
                        email: email,
                        password: password
  end

  def topic_model
    @topic_model ||= Topic.new name: topic, user: user_model
  end

end
