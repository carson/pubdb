class CreatePublicationFiles < ActiveRecord::Migration
  def self.up
    create_table :publication_files do |t|
      t.integer :publication_id
      t.integer :publication_file_type_id
      t.string  :url
      t.string  :description
      t.integer :size # file size in bytes
      t.string  :content_type # mime type, ex: application/mp3
      t.string  :filename # sanitized filename

      t.timestamps
    end
  end

  def self.down
    drop_table :publication_files
  end
end
