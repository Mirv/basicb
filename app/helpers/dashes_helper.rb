module DashesHelper
  
  # def full_title(page_title = "")                     
  #   base_name = 'Basic Borders'
  #   if page_title.empty?   
  #     page_title = base_name
  #   else
  #     page_title + " | " + base_name
  #   end
  # end
  
  def greet_user_message(name, last_login)
    msg = "Welcome #{name}! ... have not heard from you since #{last_login} !!"
  end
end
