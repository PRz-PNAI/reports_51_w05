class Contact
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :email, :message

  validates :first_name, :last_name, :email, :message, presence: true

#  def self.model_name
#    ActiveModel::Name.new(self, nil, 'Contact')
#  end
end
