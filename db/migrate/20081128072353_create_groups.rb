class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.string :name_ja
      t.text :description
      t.text :description_ja

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
