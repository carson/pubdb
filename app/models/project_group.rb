class ProjectGroup < ActiveRecord::Base
	belongs_to 	:group
	belongs_to	:project
end
