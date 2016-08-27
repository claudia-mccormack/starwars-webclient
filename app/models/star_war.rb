class StarWar
attr_accessor :character, :droid, :planet, :quote, :id
  def initialize(input)
    @id = input["id"]
    @character = input["character"]
    @droid = input["droid"]
    @planet = input["planet"]
    @quote = input["quote"]
  end

  def self.find_by(options)
    star_wars_hash = Unirest.get("http://localhost:3000/api/v2/starwars/#{options[:id]}.json").body
    StarWar.new(star_wars_hash)
  end

  def self.all
    all_star_wars = Unirest.get("http://localhost:3000/api/v2/starwars.json").body
    @starwars = []
    all_star_wars.each do |star_war|
      @starwars << StarWar.new(star_war)
    end
    return @starwars
  end

  def destroy
    @starwar = Unirest.delete('http://localhost:3000/api/v2/starwars/' + id.to_s,
        headers: {"Accept" => "application/json"}
      ).body
  end

  def teamwork
    "#{@character} and the trusty #{@droid}"
  end

  def adventure
    "Together they have landed on #{@planet}"
  end

  def lines
    "Someone says: #{@quote}"
  end

end
