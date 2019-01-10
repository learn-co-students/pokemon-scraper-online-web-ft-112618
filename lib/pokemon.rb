class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  
  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id_input, db)
     pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_input).flatten
     Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
  end 
end
