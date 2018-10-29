# require 'active_support/concern'

module DevDisplays
  # extend ActiveSupport::Concern
  class Base
    def self.displayz(aobject)
      # return nil unless object
      puts "test"
      byebug
      messagez(aobject)
    end
    
    def self.messagez(aobject)
      byebug
      aobject.id
    end
  end

  class Development
    extend DevDisplays
    def self.messagez(aobject)
      byebug
      "#{aobject.name} | #{aobject.id}"
    end
  end
end



  
  # is_dev = Rails.env.development?

  
  # class Development
  #   extend DevDisplays
  #   def self.message(object)
  #     "#{object.name} | #{object.id}"
  #   end
    
  #   def self.email(object)
  #     "#{object.email} | #{id(object)}"
  #   end   
  # end
