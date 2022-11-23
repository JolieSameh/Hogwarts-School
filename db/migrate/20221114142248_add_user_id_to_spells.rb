class AddUserIdToSpells < ActiveRecord::Migration[7.0]
  def change
    add_column :spells, :user_id, :integer
    add_index :spells, :user_id
  end
end
