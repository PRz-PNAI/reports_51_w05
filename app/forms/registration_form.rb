class RegistrationForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :title, :topic, :email, :password, :password_confirmation

  validates :first_name, :last_name, :title, :topic, :email, :password, :password_confirmation, presence: true
  validates :password, confirmation: true

  def self.model_name
    ActiveModel::Name.new(self, nil, "Registration")
  end

end
