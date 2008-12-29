module PeopleHelper
  def add_membership_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :memberships, :partial => 'membership', :object => Membership.new
    end
  end
end
