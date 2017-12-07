class President < ActiveRecord::Base
  has_many :picks

  def best_stat
    {
      charisma: self.charisma,
      strength: self.strength,
      dexterity: self.dexterity,
      intelligence: self.intelligence,
      wisdom: self.wisdom,
      stamina: self.stamina
    }.sort_by {|key, value| value}.first.first.to_s.capitalize
  end
end
