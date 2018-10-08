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

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def find(id, db)
    attributes = db.execute("SELECT * FROM db WHERE pokemon.id = ?", id)
    pokemon = self.new(id: attributes[0], name: attributes[1], type: attributes[2], db: db, hp: attributes[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
