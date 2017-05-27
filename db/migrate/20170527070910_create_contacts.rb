class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :purpose
      t.string :name
      t.integer :number

      t.timestamps
    end
  end
end
