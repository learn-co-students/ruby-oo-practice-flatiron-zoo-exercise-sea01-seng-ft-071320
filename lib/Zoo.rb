class Zoo
  attr_reader :name, :location

  @@all = []

  def initialize(name, location)
    @name, @location = name, location

    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #Instance methods for returning data
  def animals
    Animal.all.select { |animal| animal.zoo = self }
  end

  def animal_species
    animals.map(&:species).uniq
  end

  def find_by_species(species)
    animals.find { |animal| animal.species.downcase == species.downcase }
  end

  def animal_nicknames
    animals.map(&:nickname).uniq
  end

  #Class methods for aggregating data
  def self.find_by_location(location)
    all.select { |zoo| zoo.location.downcase == location.downcase }
  end
end
