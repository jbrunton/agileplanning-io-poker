class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :score
      t.boolean :ready
      t.references :room, index: true

      t.timestamps null: false
    end
    add_foreign_key :attendees, :rooms
  end
end
