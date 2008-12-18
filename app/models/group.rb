class Group < ActiveRecord::Base
	has_many :project_groups, :dependent => :destroy
	has_many :projects, :through => :project_groups
	has_many :memberships, :dependent => :destroy
	has_many :people, :through => :memberships
end
