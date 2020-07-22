class Animal
  attr_reader :species, :nickname
  attr_accessor :weight, :zoo

  @@all = []

  def initialize(species, weight, nickname)
    @species, @weight, @nickname = species, weight, nickname

    self.save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  #Class methods for aggregating data
  def self.find_by_species(species)
    all.select { |animal| animal.species == species }
  end
end
