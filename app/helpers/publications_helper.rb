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
  
  def new_event_link(name)
    link_to_function name do |page|
      page.replace_html :event_fields, :partial => 'event', :object => Event.new
      page.hide :event_select
    end
  end
  
end
