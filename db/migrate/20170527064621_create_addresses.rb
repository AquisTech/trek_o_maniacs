class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.belongs_to :user, foreign_key: true
      t.string :purpose
      t.string :address_line_1
      t.string :address_line_2
      t.string :landmark
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode

      t.timestamps
    end
  end
end
