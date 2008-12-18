class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :event_type_id
      t.string  :name
      t.string  :name_ja
      t.string  :location
      t.string  :organization
      t.date    :start_date
      t.date    :end_date
      t.string  :abbreviation
      t.integer :number
      t.string  :url

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
