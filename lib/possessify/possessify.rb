module Possessify

  String.class_eval do
    ##
    # :call-seq:
    #   str.possessive => new_str
    #
    # Returns a new string that is the possessive form of <i>str</i>.
    #   "Dave".possessive     #=> "Dave's"
    #   "Xerxes".possessive   #=> "Xerxes'"
    def possessive
      unless self.possessive? || self.empty?
        str = self + self.possessive_suffix
      end
      str || self
    end

    ##
    # :call-seq:
    #   str.non_possessive => new_str
    #
    # Returns a new string that is the non-possessive form of <i>str</i>.
    #   "Dave's".non_possessive     #=> "Dave"
    #   "Xerxes'".non_possessive    #=> "Xerxes"
    def non_possessive
      if self.possessive?
        unless self.chomp!("'s")
          self.chomp!("'")
        end
      end
      self
    end

    ##
    # :call-seq:
    #   str.possessive? => true or false
    #
    # Returns <code>true</code> if <i>str</i> is possessive.
    #   "Dave's".possessive?     #=> true
    #   "Dave".possessive?       #=> false
    def possessive?
      self[-2,2] && (self[-2,2].downcase == "'s" || self[-2,2].downcase == "s'")
    end

    ##
    # :call-seq:
    #   str.non_possessive? => true or false
    #
    # Returns <code>true</code> if <i>str</i> is not in possessive form.
    #   "Dave's".non_possessive?     #=> false
    #   "Dave".non_possessive?       #=> true
    def non_possessive?
      !self.possessive?
    end

    ##
    # :call-seq:
    #   str.possessive_suffix => new_str
    #
    # Returns a new string of the possessive suffix regardless of wehether
    # the string is already in possessive form or not.
    #   "Dave's".possessive_suffix     #=> "'s"
    #   "Dave".possessive_suffix       #=> "'s"
    #   "Xerxes'".possessive_suffix    #=> "'"
    def possessive_suffix
      str = self.non_possessive
      (str[-1,1] && str[-1,1].downcase == "s") ? "'" : "'s"
    end
  end
end
