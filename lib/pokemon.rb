require "pry"
class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id: id, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
  end


  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",pk_name, pk_type)
  end

  def self.find(pk_id, db)
    pokemon = db.execute("SELECT id, name, type FROM pokemon WHERE id = #{pk_id} ")
    new_pokomen = Pokemon.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], db: db)
    #binding.pry

  end

end
