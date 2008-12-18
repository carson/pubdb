class Conference < ActiveRecord::Base
	belongs_to :publication
	belongs_to :event
end
