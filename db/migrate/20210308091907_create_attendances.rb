class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.references :attendee, null: false, references: :users, index: true
      t.references :attended_events, null: false, references: :events, index: true

      t.timestamps
    end
    add_foreign_key :attendances, :users, column: :attendee_id
    add_foreign_key :attendances, :events, column: :attended_events_id
  end
end
