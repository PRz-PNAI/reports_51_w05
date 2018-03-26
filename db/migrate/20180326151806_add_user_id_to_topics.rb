class AddUserIdToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :user_id, :integer
    add_foreign_key :topics, :users
  end
end