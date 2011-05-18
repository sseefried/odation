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

def social_helpers(id, title, body, type = "button")
  if (type == "button")
html = ""
html = <<HTML
  <div class="social_header"><div id="fb-root"></div><fb:like href="http://odation.com/posts/#{id}" send="true"  layout="button_count" width="450" show_faces="false" font=""></fb:like></div>
HTML
html.html_safe                   
  else                           
html = ""
html = <<HTML
   <div style="position: absolute; top: 5px; right: 5px;width: 100px;"><div id="fb-root"></div><script src="http://connect.facebook.net/en_US/all.js#appId=202341553141662&amp;xfbml=1"></script><fb:like href="http://odation.com/posts/#{id}" send="false" layout="box_count" width="450" show_faces="false" font=""></fb:like></div>
HTML
html.html_safe  
end

end

end
