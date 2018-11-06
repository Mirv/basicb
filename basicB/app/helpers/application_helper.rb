module ApplicationHelper

  def full_title(page_title = "")                     
    base_name = 'Basic Borders'
    if page_title.empty?   
      page_title = base_name
    else
      page_title + " | " + base_name
    end
  end
  
  def name_id(target)
    if target.present?
      "#{target.name} | #{target.id}"
    else
      "#{target.id}"
    end
  end
  
  def email_name(target)
    if target.email
      "#{target.email} | #{name_id(target)}"
    else
      name_id(target)
    end
  end

  def displayList(the_list, remove_this)
    result = String.new

    if !the_list.nil?
      list_columns = the_list.attribute_names - remove_this
      for x in list_columns
         result << "<li>#{x.capitalize}:  #{the_list[x]}</li>"
      end
    else
     result = "Empty!  Shall we fill it boss?"
    end
    return result.html_safe
  end
  
  def listHorizontal(listing, spacer = ', ', remove_this)
    if !listing.nil?
      list_columns = listing.attribute_names - remove_this
      result = String.new
      for x in list_columns
         result << "#{x.capitalize}:  #{listing[x]}#{spacer}"
      end
      result = result.chomp(spacer)
    else
      result = "Empty!  Shall we fill it boss?"
    end
    
    return result
  end
  def build_list_colums_to_show(the_list, remove_this, html_tag_pref)
        list_columns = the_list.attribute_names - remove_this
      for x in list_columns
         result << "#{x.capitalize}:  #{listing[x]}#{spacer}"
      end
    end
end