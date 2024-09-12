class AddAgeToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :age, :integer
  end
end
