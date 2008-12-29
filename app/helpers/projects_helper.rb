module ProjectsHelper
  def add_project_group_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :project_groups, :partial => 'project_group', :object => ProjectGroup.new
    end
  end
end
