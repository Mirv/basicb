module ApplicationHelper

  def full_title(page_title = "")                     
    base_name = 'Basic Borders'
    if page_title.empty?   
      page_title = base_name
    else
      page_title + " | " + base_name
    end
  end
  
  def displayList the_list, the_noun
    if (the_list.count > 1) then
        # render partial: 'shared/list_options/list_item_entry', locals: { the_list: the_list }
        will_paginate the_list
    else
     return  "No #{the_noun.capitalize} found."
    end
  end
  
  def listHorizontal(listing, spacer = ', ')
    list_columns = listing.attribute_names
    result = Array.new
    for x in list_columns
       result << "#{x.capitalize}:  #{listing[x]}"
    end
    result = result.join(spacer)
    return result
  end
  
end