class Report < ApplicationRecord
	validates :content, :email, :first_name, :last_name, presence: true
end
