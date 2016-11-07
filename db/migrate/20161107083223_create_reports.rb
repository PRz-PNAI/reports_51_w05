class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :content
      t.text :comment
      t.string :grade

      t.timestamps
    end
  end
end
