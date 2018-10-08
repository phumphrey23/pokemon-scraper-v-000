class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  @@all = []
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id= id
    @name= name
    @type= type
    @db= db
    @hp= hp
    @@all << self
  end

  def self.save
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def find

  end

end
