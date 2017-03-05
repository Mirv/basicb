require 'active_support/concern'

module Filler
  include ActiveSupport::Concern

  def hello
    msg = "hi hi world"
  end
end

class RecordTools
  extend Filler

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
  
  #
  ##  Duck type hiding here, 
  ##  ...but need to examine how to best handle assignment versus merge
  #
  def addFields index, data
    @fields[index.to_sym] = data
  end
  
  def addFieldsS index, data
    @fields[index] = data
  end
  
  def addField aHash = {}
    @fields = @fields.merge(aHash)
  end
  
  def getFields
    @fields
  end
  
  #
  # Takes an object (with an ID) & count
  # Spits out random id number > 0 & != original object id number
  #

 
end

class Randomiz < RecordTools
  
  @size = 20 

  # No zero's assigned
  def ran(number)
    number = 1 + rand(number)
  end

  def findAnotherID known_id, count
    @target_id = known_id
    # Ensure we loop until a country isn't it's own neighbor & not zero
    until @target_id != known_id do
      @target_id = 1 + rand(count) 
    end
    return @target_id
  end 
  
  def add_numbers(msg, size, modifier=1)
    num = size * modifier
    msg = "#{msg}, the #{ran(num)} of their name."
    return msg
  end
  
  def suffix_num(msg, size, modifier=1)
    num = size * modifier
    num = ran(num)

      
    msg = "#{msg}, the #{num}#{@ending} of their name."
  return msg
end

  def ordinalize(num)
    @ending = "th"
    
    case num
    when 1
      @ending = 'st'
    when 2
      @ending = 'nd'
    when 3
      @ending = 'rd'
    end
    
    return @ending
  end

end