class CreatePublicationProjects < ActiveRecord::Migration
  def self.up
    create_table :publication_projects do |t|
      t.column	:publication_id,	:integer
      t.column	:project_id,	:integer
      t.timestamps
    end
  end

  def self.down
    drop_table :publication_projects
  end
end
