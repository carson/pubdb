class CreateAuthorships < ActiveRecord::Migration
  def self.up
    create_table :authorships do |t|
      t.integer :person_id
      t.integer :publication_id
      t.integer :priority

      t.timestamps
    end
  end

  def self.down
    drop_table :authorships
  end
end
