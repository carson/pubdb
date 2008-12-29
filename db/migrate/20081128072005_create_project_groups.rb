class CreateProjectGroups < ActiveRecord::Migration
  def self.up
    create_table :project_groups do |t|
      t.integer :project_id
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :project_groups
  end
end
