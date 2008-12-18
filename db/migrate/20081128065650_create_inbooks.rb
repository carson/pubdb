class CreateInbooks < ActiveRecord::Migration
  def self.up
    create_table :inbooks do |t|
      t.column  :publication_id, :integer
      t.column  :book_title, :string
      t.column  :book_title_ja, :string
      t.column  :editors, :string
      t.column  :isbn, :string
      t.column  :publication_date, :date
      t.column  :publisher, :string
      t.column  :address, :string
      t.column  :start_page, :integer
      t.column  :end_page, :integer
      t.column  :edition, :string
      t.column  :series, :string
      t.column  :abstract, :text

      t.timestamps
    end
  end

  def self.down
    drop_table :inbooks
  end
end
