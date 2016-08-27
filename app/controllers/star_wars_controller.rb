class StarWarsController < ApplicationController
  def index
    @starwars = StarWar.all
    # api_star_wars = Unirest.get("http://localhost:3000/api/v2/starwars.json").body
    # @starwars = []
    # api_star_wars.each do |api_star_war|
    #   @starwars << StarWar.new(api_star_war)
    # end
  end

  def new
  end

  def create
    @starwar = Unirest.post("http://localhost:3000/api/v2/starwars",
    headers:{"Accept" => "application/json"},
    parameters:{character: params[:character],
      droid: params[:droid],
      planet: params[:planet],
      quote: params[:quote]}
    ).body
    redirect_to "/star_wars/#{@starwar["id"]}"
  end

  def show
    @starwar = StarWar.find_by(id: params[:id])
    # star_war_hash = Unirest.get("http://localhost:3000/api/v2/starwars/#{params[:id]}.json").body
    # @starwar = StarWar.new(star_war_hash)
  end

  def edit
    @starwar = Unirest.get("http://localhost:3000/api/v2/starwars/#{params[:id]}.json").body
  end

  def update
    @starwar = Unirest.patch("http://localhost:3000/api/v2/starwars/#{params[:id]}.json",
    headers:{"Accept" => "application/json"},
    parameters:{character: params[:character],
      droid: params[:droid],
      planet: params[:planet],
      quote: params[:quote]}
    ).body
    redirect_to "/star_wars/#{@starwar['id']}"
  end

  def destroy
    @starwar = StarWar.find_by(id: params[:id])
    @starwar.destroy
    redirect_to "/star_wars"
  end
end
