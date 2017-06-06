class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.belongs_to :resource, polymorphic: true
      t.string :purpose
      t.string :name
      t.string :number

      t.timestamps
    end
  end
end
