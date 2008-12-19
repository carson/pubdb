class Person < ActiveRecord::Base
	has_many :authorships, :dependent => :destroy
	has_many :memberships, :dependent => :destroy
	has_many :groups, :through => :memberships
	has_many :activities
	
	validates_presence_of :first_name
	validates_presence_of :first_name_ja
	validates_presence_of :last_name
	validates_presence_of :last_name_ja
end
