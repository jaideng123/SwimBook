class RenameIdeaToEntrie < ActiveRecord::Migration
  def change
	rename_table :ideas, :entries
  end
end
