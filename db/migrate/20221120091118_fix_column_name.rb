class FixColumnName < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :relationships, :followed_id, :followee_id
  end
end
