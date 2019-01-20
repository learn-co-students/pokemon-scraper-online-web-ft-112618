class Pokemon

  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def self.all
    @@all
  end

  def initialize (id: nil, name: nil, type: nil, hp: 60, db: nil)#makes hp optional
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id,db)
    row = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)[0]
    row_id = row[0]
    row_name = row[1]
    row_type = row[2]
    row_hp = row[3]
    pokemon_object = Pokemon.new(id: row_id, name: row_name, type: row_type, hp: row_hp, db: db)
    pokemon_object
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
