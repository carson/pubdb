class CreateTechreports < ActiveRecord::Migration
  def self.up
    create_table :techreports do |t|
      t.column	:publication_id, :integer
      t.column  :publication_date, :date
      t.column  :publisher, :string
      t.column  :address, :string
      t.column  :edition, :string
      t.column  :series, :string
      t.column  :number, :integer
      t.column  :abstract, :text

      t.timestamps
    end
  end

  def self.down
    drop_table :techreports
  end
end
