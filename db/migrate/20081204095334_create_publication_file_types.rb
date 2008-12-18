class CreatePublicationFileTypes < ActiveRecord::Migration
  def self.up
    create_table :publication_file_types do |t|
      t.string :description
      t.string :description_ja

      t.timestamps
    end
  end

  def self.down
    drop_table :publication_file_types
  end
end
