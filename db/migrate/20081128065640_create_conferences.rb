class CreateConferences < ActiveRecord::Migration
  def self.up
    create_table :conferences do |t|
      t.column	:event_id, :integer
      t.column	:publication_id, :integer
      t.column  :proceedings_title, :string
      t.column  :proceedings_title_ja, :string
      t.column  :start_page, :integer
      t.column  :end_page, :integer
      t.column  :abstract, :text
      t.column  :abstract_ja, :text
      t.column  :is_invited, :boolean
      t.column  :is_review, :boolean

      t.timestamps
    end
  end

  def self.down
    drop_table :conferences
  end
end
