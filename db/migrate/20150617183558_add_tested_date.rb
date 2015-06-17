class AddTestedDate < ActiveRecord::Migration
  def change
	add_column :entries, :tested, :date 
  end
end
