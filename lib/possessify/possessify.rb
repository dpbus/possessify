module Possessify

  String.class_eval do
    def possessive
      str = self
      unless str.possessive? || str.blank?
        str = str + (str[-1,1] && str[-1,1].downcase == "s" ? "'" : "'s")
      end
      str
    end
  
    def non_possessive
      if self.possessive?
        unless self.chomp!("'s")
          self.chomp!("'")
        end
      end
      self
    end
  
    def possessive?
      self[-2,2] && (self[-2,2].downcase == "'s" || self[-2,2].downcase == "s'")
    end
  end
  
end
