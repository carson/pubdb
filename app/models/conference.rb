class Conference < ActiveRecord::Base
	belongs_to :publication
	belongs_to :event
	
	validates_presence_of :proceedings_title
	validates_presence_of :proceedings_title_ja
end
