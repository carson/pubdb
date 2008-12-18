class Event < ActiveRecord::Base
	belongs_to :event_type
	has_many :conferences
	has_many :activities
end
