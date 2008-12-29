class Publication < ActiveRecord::Base
  has_many :authorships, :dependent => :destroy
  has_many :people, :through => :authorships
  has_many :publication_projects, :dependent => :destroy
  has_many :projects, :through => :publication_projects
  has_many :publication_files, :dependent => :destroy
  # Type specific models. Note that these are different from files
  has_one :article, :dependent => :destroy
  has_one :book, :dependent => :destroy
  has_one :conference, :dependent => :destroy
  has_one :inbook, :dependent => :destroy
  has_one :misc, :dependent => :destroy
  has_one :techreport, :dependent => :destroy
  has_one :thesis, :dependent => :destroy
  
  validates_presence_of :title, :if => :empty_japanese_title
  validates_presence_of :title_ja, :if => :empty_english_title
  
  def empty_english_title
    not self.title.nil?
  end

  def empty_japanese_title
    not self.title_ja.nil?
  end
	
  validates_associated :authorships
  validates_associated :publication_projects
  validates_associated :publication_files
  validates_associated :article
  validates_associated :book
  validates_associated :conference
  validates_associated :inbook
  validates_associated :misc
  validates_associated :techreport
  validates_associated :thesis


  # Methods to update subfields (article, book, etc)
  after_update :save_subfields
      
  def save_subfields
    article.save(false)    if !article.nil?
    book.save(false)       if !book.nil?
    conference.save(false) if !conference.nil?
    inbook.save(false)     if !inbook.nil?
    misc.save(false)       if !misc.nil?
    techreport.save(false) if !techreport.nil?
    thesis.save(false)     if !thesis.nil?
  end
  
  # Methods to dynamically handle multiple authorships
  after_update :save_authorships
  
  def new_authorship_attributes=(authorship_attributes)
    authorship_attributes.each do |attributes|
      authorships.build(attributes)
    end
  end
  
  def existing_authorship_attributes=(authorship_attributes)
    authorships.reject(&:new_record?).each do |authorship|
      attributes = authorship_attributes[authorship.id.to_s]
      if attributes
        authorship.attributes = attributes
      else
        authorships.delete(authorship)
      end
    end
  end
  
  def save_authorships
      authorships.each do |authorship|
      authorship.save(false) # false so that validation invoked with true when publication model saved
    end
  end
	
	# Methods to dynamically handle multiple publication_projects
	after_update :save_publication_projects
	
	def new_publication_project_attributes=(publication_project_attributes)
    publication_project_attributes.each do |attributes|
      publication_projects.build(attributes)
    end
  end
  
  def existing_publication_project_attributes=(publication_project_attributes)
    publication_projects.reject(&:new_record?).each do |publication_project|
      attributes = publication_project_attributes[publication_project.id.to_s]
      if attributes
        publication_project.attributes = attributes
      else
        publication_projects.delete(publication_project)
      end
    end
  end
  
  def save_publication_projects
      publication_projects.each do |publication_project|
      publication_project.save(false) # false so that validation invoked with true when publication model saved
    end
  end
	
	# Methods to dynamically handle multiple publication_files
	after_update :save_publication_files
	
	def new_publication_file_attributes=(publication_file_attributes)
    publication_file_attributes.each do |attributes|
      publication_files.build(attributes)
    end
  end
  
  def existing_publication_file_attributes=(publication_file_attributes)
    publication_files.reject(&:new_record?).each do |publication_file|
      attributes = publication_file_attributes[publication_file.id.to_s]
      if attributes
        publication_file.attributes = attributes
      else
        publication_files.delete(publication_file)
      end
    end
  end
  
  def save_publication_files
      publication_files.each do |publication_file|
      publication_file.save(false) # false so that validation invoked with true when publication model saved
    end
  end

end
