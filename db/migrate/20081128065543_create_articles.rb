class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.column	:publication_id, :integer
      t.column  :journal_title, :string
      t.column  :journal_title_ja, :string
      t.column  :volume, :integer
      t.column  :issue, :integer
      t.column  :start_page, :integer
      t.column  :end_page, :integer
      t.column  :publication_date, :date
      t.column  :publisher, :string
      t.column  :address, :string
      t.column  :abstract, :text
      t.column  :abstract_ja, :text
      t.column  :is_invited, :boolean
      t.column  :is_review, :boolean

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
