class Event < ActiveRecord::Base
	belongs_to :event_type
	has_many :conferences
	has_many :activities, :dependent => :destroy
	
	validates_associated :event_type
	validates_presence_of :event_type_id
	validates_presence_of :name
	validates_presence_of :name_ja
end
