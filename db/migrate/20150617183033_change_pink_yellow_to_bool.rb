class ChangePinkYellowToBool < ActiveRecord::Migration
  def change
	remove_column :entries, :pink
	remove_column :entries, :yellow
	add_column :entries, :pink, :boolean
	add_column :entries, :yellow, :boolean
  end
end
