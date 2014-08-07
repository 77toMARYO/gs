class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github_id
      t.integer :used_point

      t.timestamps
    end
  end
end
