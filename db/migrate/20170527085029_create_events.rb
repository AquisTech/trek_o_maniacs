class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :venue, foreign_key: true
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.text :event_leaders
      t.string :status
      t.text :short_description
      t.text :description
      t.text :attractions
      t.integer :cost
      t.text :inclusions
      t.text :exclusions
      t.text :things_to_carry
      t.text :payment_details
      t.text :itinerary
      t.string :assembly_point
      t.datetime :assembly_time
      t.text :contact_details
      t.text :disclaimer

      t.timestamps
    end
  end
end
