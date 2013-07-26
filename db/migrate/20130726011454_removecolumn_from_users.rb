class RemovecolumnFromUsers < ActiveRecord::Migration
  def up
    remove_column :users,:is_arrive
  end

  def down
    add_column :users,:is_arrive, :integer
  end
end
