class Inbook < ActiveRecord::Base
  belongs_to :publication
  validates_presence_of :book_title, :if => :empty_japanese_title
  validates_presence_of :book_title_ja, :if => :empty_english_title
  
  def empty_english_title
    not self.book_title.nil?
  end

  def empty_japanese_title
    not self.book_title_ja.nil?
  end
end
