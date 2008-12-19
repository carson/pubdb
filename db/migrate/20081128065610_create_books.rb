class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.column  :publication_id, :integer
      t.column  :editors, :string
      t.column  :publication_date, :date
      t.column  :publisher, :string
      t.column  :address, :string
      t.column  :edition, :string
      t.column  :series, :string
      t.column  :isbn, :string
      t.column  :abstract, :text

      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
