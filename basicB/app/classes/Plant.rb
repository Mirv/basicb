require 'active_support/concern'

module Plant
    def sayModule; puts "\nThis is the module level.\n"; end
    
    class Flower
        def sayClass2; puts "\nThis is the class level.\n"; end
    end
    
    class Flower2 < Flower
        extend ActiveSupport::Concern
        extend Plant
        
        def sayClass; puts "\nThis is the class Flower2.\n"; end
        def sayClass2; super; end
        def sayModule; Super; end
    end
    
end