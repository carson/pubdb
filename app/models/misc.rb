class Misc < ActiveRecord::Base
  belongs_to :publication

  validates_presence_of :description, :if => :empty_japanese_title
  validates_presence_of :description_ja, :if => :empty_english_title
  
  def empty_english_title
    not self.description.nil?
  end

  def empty_japanese_title
    not self.description_ja.nil?
  end
end
