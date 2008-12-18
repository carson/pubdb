class Project < ActiveRecord::Base
	has_many :publication_projects
	has_many :project_groups, :dependent => :destroy
	has_many :groups, :through => :project_groups
end
