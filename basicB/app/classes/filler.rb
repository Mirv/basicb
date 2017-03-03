require 'active_support/concern'

module Fillme
  include ActiveSupport::Concern
  def hello
    "hi hi world"
  end
end

class Filler
  def initialize 
   @table = ""
   @fields = Hash.new
  end
 
  # --- Table accessors --- #
  def setTable table
    @table = table
  end

  def getTable
    @table
  end

  # --- Field accessors --- #
  def addFields index, data
    @fields[index.to_sym] = data
  end
  
  def addFieldsS index, data
    @fields[index] = data
  end
  
  def addField aHash = {}
    @fields.merge(aHash)
  end
  
  def getFields
    @fields
  end
  
  #
  # Takes an object (with an ID) & count
  # Spits out random id number > 0 & != original object id number
  #
  def randNonMatch known_obj, count
    target_id = known_obj
    # Ensure we loop until a country isn't it's own neighbor & not zero
    while target_id == known_obj.id do
      target_id = 1 + rand(count) 
    end
    return target_id
  end 
 
end