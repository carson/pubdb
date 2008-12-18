class CreateTheses < ActiveRecord::Migration
  def self.up
    create_table :theses do |t|
      t.column  :publication_id, :integer
      t.column  :degree, :string
      t.column  :publication_date, :date
      t.column  :school, :string
      t.column  :address, :string
      t.column  :pages, :integer
      t.column  :abstract, :text

      t.timestamps
    end
  end

  def self.down
    drop_table :theses
  end
end
