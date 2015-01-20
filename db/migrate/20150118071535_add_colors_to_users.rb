class AddColorsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :red, :integer
    add_column :users, :green, :integer
    add_column :users, :blue, :integer
  end
end
