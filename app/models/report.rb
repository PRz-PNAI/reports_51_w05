class Report < ApplicationRecord
	validates :content, :email, :first_name, :last_name, presence: true
  validates :content, length: { in: 100..1500 }
  validates :last_name, length: { in: 3..40 }
  validates :first_name, length: { in: 2..40 }
  validates :email, format: { with: /\A^[^@]+@[^@\.]+\.[^@]+\z/ }
end
