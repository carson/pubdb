class Project < ActiveRecord::Base
  has_many :publication_projects, :dependent => :destroy
  has_many :publications, :through => :publication_projects
  has_many :project_groups, :dependent => :destroy
  has_many :groups, :through => :project_groups

  validates_presence_of :name
  validates_presence_of :name_ja
  
  validates_associated :project_groups
  
  
  # Methods to dynamically handle multiple project_groups
  after_update :save_project_groups
  
  def new_project_group_attributes=(project_group_attributes)
    project_group_attributes.each do |attributes|
      project_groups.build(attributes)
    end
  end
  
  def existing_project_group_attributes=(project_group_attributes)
    project_groups.reject(&:new_record?).each do |project_group|
      attributes = project_group_attributes[project_group.id.to_s]
      if attributes
        project_group.attributes = attributes
      else
        project_groups.delete(project_group)
      end
    end
  end
  
  def save_project_groups
    project_groups.each do |project_group|
      project_group.save(false) # false so that validation invoked with true when model saved
    end
  end
  
end
