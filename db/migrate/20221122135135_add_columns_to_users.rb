class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name,       :string ,              null: false, default: ""
    add_column :users, :house,      :string ,              null: false, default: ""
    add_column :users, :bio,        :string 
    add_column :users, :birthday,   :date
    add_column :users, :relatives,  :boolean ,             null: false, default: false
  end
end