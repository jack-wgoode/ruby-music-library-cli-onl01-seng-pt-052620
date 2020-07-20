
 

module Concerns::Findable
    
    def find_by_name(name)
        self.all.detect {|a| a.name == name}
        
    end
    
    def find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end
 

def self.sort_by_name
    self.all.sort! { |a,b| a.name.downcase <=> b.name.downcase }
end 
  
  
end



    
    
  