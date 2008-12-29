class Article < ActiveRecord::Base
  belongs_to :publication

  validates_presence_of :journal_title, :if => :empty_japanese_title
  validates_presence_of :journal_title_ja, :if => :empty_english_title
  
  def empty_english_title
    not self.journal_title.nil?
  end

  def empty_japanese_title
    not self.journal_title_ja.nil?
  end

end
