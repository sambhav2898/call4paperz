module ApplicationHelper
  def menu
    content_tag :nav, id: "main-nav" do
      content = ''
      content << link_to("Home", root_url)
      content << link_to("Events", events_path)
      if user_signed_in?
        content << link_to("Profile", profile_path)
        content << link_to("Logout", destroy_user_session_path, :method => :delete)
      else
        content << link_to("Login", new_user_session_path)
      end
      content.html_safe
    end
  end

  def users_number
    User.count
  end

  def render_flash_notice
    if flash[:notice]
      content_tag :p, flash[:notice], class: "notice"
    end
  end

  def page_id
    controller_name = controller_path.gsub(/\//, "_")
    "#{controller_name}-#{action_name}"
  end
end
