module ApplicationHelper

def page_title(title)
  content_for(:title) do  
    title
  end
end
 
def nav_helper(name, goto_path, title, page_controller)
  if (page_controller == controller_name)
    link_to(name, goto_path, :class => 'selected', :title => title)
  else
    link_to(name, goto_path, :title => title)
  end
end
  
  def google_ads(&block)
    content_tag(:div, :class => "google_ads",  &block) unless current_user
  end

  def admin_area(id = "", &block)
    content_tag(:div, :class => "admin", :id => id,  &block) if is_admin
  end

  def signed_in(id = "", &block)
    content_tag(:div, :class => "signed_in", :id => id, &block) if current_user 
  end
  
  def not_signed_in(id = "", &block)
    content_tag(:div, :class => "not_signed_in", :id => id, &block) unless current_user
  end
  
  def is_admin
    if (current_user) && (current_user.id == 2)
      is_admin = true
    end
  end
  
  def posted_at(post_created_at)
    too_long_ago = Time.now - 120.minutes
    if (post_created_at > too_long_ago)
      posted_at = "Posted " + time_ago_in_words(post_created_at) + " ago"
    else
      posted_at = "Posted " + post_created_at.to_s(:month)
    end
  end  

end
