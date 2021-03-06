module ApplicationHelper

  #def sample_helper
  #  "<h1>Ejemplo de un view Helper</h1>".html_safe
  #end

  def sample_helper
    content_tag(:div, "My content", class: "my-class")
  end

  def login_helper(style='')

     if current_user.is_a?(GuestUser)
       (link_to "Register", new_user_registration_path, class: style) + 
       " ".html_safe +
       (link_to "Login", new_user_session_path, class: style)
     else
       link_to "Logout", destroy_user_session_path, method: :delete, class: style
     end

  end

  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}. Please contact me in  #{link_to 'Contact me', contact_path} if you like to work together"
      content_tag(:div, greeting.html_safe,class: styles)
    end
  end

  def copyright_generator
    MyCompanyViewTool::Renderer.copyright "Senior nor", "All rights reserved"
  end

  def nav_items

    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
            {
        url: tech_news_path,
        title: 'Tech news'
      },
    ]

  end

  def nav_helper style, tag_type
    
    nav_links = ''

    nav_items.each do |item|

      nav_links << "<#{tag_type}><a href='#{item[:url]}', class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"

    end

    nav_links.html_safe

  end

  def active? path 
    "active" if current_page? path 
  end

end
