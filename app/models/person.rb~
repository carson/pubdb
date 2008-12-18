class Person < ActiveRecord::Base
	has_many :authorships, :dependent => :destroy
	has_many :memberships, :dependent => :destroy
	has_many :groups, :through => :memberships
	has_many :activities
end
