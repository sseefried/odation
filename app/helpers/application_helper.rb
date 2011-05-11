module ApplicationHelper
 

 
  def tab_selector(name, path, options)
    controller = options.delete(:controller)
    action = options.delete(:controller)
    klass = [].push(options[:class]).compact
    if current_controller?(controller)
      klass.push("selected")
    end

    link_to(name, path, options)
  end

end
