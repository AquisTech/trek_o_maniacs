class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :purpose
      t.string :grade
      t.string :region
      t.text :description
      t.text :attractions

      t.timestamps
    end
  end
end
