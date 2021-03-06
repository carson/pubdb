class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.timestamps
      t.column :title, :string
      t.column :title_ja, :string
      t.column :year, :date
      t.column :publication_type, :string
    end
  end

  def self.down
    drop_table :publications
  end
end
