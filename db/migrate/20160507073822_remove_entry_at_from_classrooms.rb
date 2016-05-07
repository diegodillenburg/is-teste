class RemoveEntryAtFromClassrooms < ActiveRecord::Migration
  def change
    remove_column :classrooms, :entry_at
  end
end
