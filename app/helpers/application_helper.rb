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
    unless (current_user) && (current_user.id == 2)
      is_admin = true
    end
  end
  
  def is_any(post, style_class = "block" ,&block)
     content_tag(:div, :class => style_class,&block) if post 
  end
  
  def posted_at(post_created_at)
    too_long_ago = Time.now - 120.minutes
    if (post_created_at > too_long_ago)
      posted_at = " " + time_ago_in_words(post_created_at) + " ago"
    else
      posted_at = " " + post_created_at.to_formatted_s(:short) 
    end
  end  

  def shorten (string, count = 30)
  	if string.length >= count 
  		shortened = string[0, count]
  		splitted = shortened.split(/\s/)
  		words = splitted.length
  		splitted[0, words-1].join(" ") + ' ...'
  	else 
  		string
  	end
  end
  
  def avatar_helper(content)
    content.user.authentications.each do |t|
      if (t.provider == "facebook") && ( @graph.get_picture? )
        
          image_tag @graph.get_picture(t.uid)
      
      else
        image_tag content.user.image_url(:small_teaser), :title => "Author - #{content.user.email}", :class => "avatar"
        
      end
      if (t.provider == "twitter")
         image_tag content.user.image_url(:small_teaser), :title => "Author - #{content.user.email}", :class => "avatar"
       end
    end
  end
  
  def environment(env, &block)
    if env == "development"
      content_tag(:div, :class => "devel",  &block)
    end
  end
    

end
