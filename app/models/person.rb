class Person < ActiveRecord::Base
  has_many :memberships, :dependent => :destroy
  has_many :publications, :through => :memberships
  has_many :memberships, :dependent => :destroy
  has_many :groups, :through => :memberships
  has_many :activities, :dependent => :destroy

  validates_presence_of :first_name
  validates_presence_of :first_name_ja
  validates_presence_of :last_name
  validates_presence_of :last_name_ja
  
  validates_associated :memberships
  
  
  # Methods to dynamically handle multiple memberships
  after_update :save_memberships
  
  def new_membership_attributes=(membership_attributes)
    membership_attributes.each do |attributes|
      memberships.build(attributes)
    end
  end
  
  def existing_membership_attributes=(membership_attributes)
    memberships.reject(&:new_record?).each do |membership|
      attributes = membership_attributes[membership.id.to_s]
      if attributes
        membership.attributes = attributes
      else
        memberships.delete(membership)
      end
    end
  end
  
  def save_memberships
    memberships.each do |membership|
      membership.save(false) # false so that validation invoked with true when model saved
    end
  end
  
end
