class CreateMiscs < ActiveRecord::Migration
  def self.up
    create_table :miscs do |t|
      t.column :publication_id, :integer
      t.column :description, :text
      t.column :description_ja, :text
      t.column :url, :string
      t.column :date, :date

      t.timestamps
    end
  end

  def self.down
    drop_table :miscs
  end
end
