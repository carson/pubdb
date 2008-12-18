module PublicationsHelper

  def add_authorship_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :authorships, :partial => 'authorship' , :object => Authorship.new
    end
  end
  
  def add_publication_project_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :publication_projects, :partial => 'publication_project' , :object => PublicationProject.new
    end
  end
  
  def add_publication_file_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :publication_files, :partial => 'publication_file' , :object => PublicationFile.new
    end
  end
  
end
