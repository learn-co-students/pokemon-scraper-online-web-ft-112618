class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id: nil, name: nil, type: nil, hp: nil, db: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)[0]
    row_id, row_name, row_type, row_hp = row[0], row[1], row[2], row[3]
    pokemon_object = Pokemon.new(id: row_id, name: row_name, type: row_type, hp: row_hp, db: db)
    pokemon_object
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
