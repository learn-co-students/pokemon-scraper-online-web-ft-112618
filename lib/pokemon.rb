class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id: id, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
  end


  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (pk_name, pk_type)")
  end

end
