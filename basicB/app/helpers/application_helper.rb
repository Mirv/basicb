module ApplicationHelper

  def full_title(page_title = "")                     
    base_name = 'Basic Borders'
    if page_title.empty?   
      page_title = base_name
    else
      page_title + " | " + base_name
    end
  end
  
  def dashboard_path
    the_id = 1 unless current_user.id
    @d_pash = "/dashes/#{the_id}" 
    return @d_pash
  end
  
  #   def full_title(page_title = '')                     
  #   base_title = "Basic Borders" 
  #   if page_title.empty?                             
  #     base_title                                     
  #   else
  #     page_title + " | " + base_title
  #   end
  # end
  
end