class PublicationFile < ActiveRecord::Base
    belongs_to :publication
    belongs_to :publication_file_type
    has_attachment :storage => :file_system, :path_prefix => 'public/publication_files'
    validates_as_attachment
end
