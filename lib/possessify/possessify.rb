String.class_eval do
  def possessive
    if self.possessive? || self.blank?
      self
    else
      self + (self[-1,1] && self[-1,1].downcase == "s" ? "'" : "'s")
    end
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