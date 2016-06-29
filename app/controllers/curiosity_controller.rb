class CuriosityController < ApplicationController
	def new
		
	end

  def index
  	camera = params[:camera]
  	time = Time.new
  	@photos = []
  	4.times do |i|
	  	response = HTTParty.get("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=#{1000 - i }&camera=#{camera}&api_key=#{ENV['NASA_KEY']}")
	  	if response['photos']
		  	@photos += response['photos']
		  end
  	end
  	render "curiosity/index"
  end
end
