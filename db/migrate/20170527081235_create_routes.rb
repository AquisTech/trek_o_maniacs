class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.belongs_to :venue, foreign_key: true
      t.string :name
      t.text :description
      t.integer :distance
      t.text :modes_of_transport

      t.timestamps
    end
  end
end
