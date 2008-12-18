class PublicationProject < ActiveRecord::Base
	belongs_to :publication
	belongs_to :project
end
