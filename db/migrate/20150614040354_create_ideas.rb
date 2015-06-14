class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.string :parent
      t.date :pink
      t.date :yellow
      t.string :guard

      t.timestamps
    end
  end
end
