module ApplicationHelper

  #def sample_helper
  #  "<h1>Ejemplo de un view Helper</h1>".html_safe
  #end

  def sample_helper
    content_tag(:div, "My content", class: "my-class")
  end

  def login_helper style

     if current_user.is_a?(GuestUser)
       (link_to "Register", new_user_registration_path, class: style) + 
       " ".html_safe +
       (link_to "Login", new_user_session_path, class: style)
     else
       link_to "Logout", destroy_user_session_path, method: :delete, class: style
     end

  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}. You're in #{layout_name}"
      content_tag(:p, greeting,class: "my-source-helper-class")
    end
  end

  def copyright_generator
    MyCompanyViewTool::Renderer.copyright "Senior nor", "All rights reserved"
  end

end
