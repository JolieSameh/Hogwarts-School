class CreateWizards < ActiveRecord::Migration[7.0]
  def change
    create_table :wizards do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :house
      t.string :bio
      t.date :birthday
      t.boolean :relatives

      t.timestamps
    end
  end
end
