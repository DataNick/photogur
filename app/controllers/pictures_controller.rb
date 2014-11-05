class PicturesController < ApplicationController

 def index
    @pictures = Picture.all
     
  end

  def show
  	@picture = Picture.find(params[:id])

  end
	
  def new
  	@picture = Picture.new
  end

  def create
  	# make a new picture with what picture_params returns (which is a method we're calling)
  	   @picture = Picture.new(picture_params)
  	   if @picture.save
  	     # if the save for the picture was successful, go to index.html.erb
  	     redirect_to pictures_url
  	   else
  	     # otherwise render the view associated with the action :new (i.e. new.html.erb)
  	     render :new
  	   end
  end

  private
  def picture_params
  	params.require(:picture).permit(:artist, :title, :url)
  end
end


 # {
 #        :title  => "The old church on the coast of White sea",
 #        :artist => "Sergey Ershov",
 #        :url    => "http://bitmakerlabs.s3.amazonaws.com/photogur/house.jpg"
 #      },
 #      {
 #        :title  => "Sea Power",
 #        :artist => "Stephen Scullion",
 #        :url    => "http://bitmakerlabs.s3.amazonaws.com/photogur/wave.jpg"
 #      },
 #      {
 #        :title  => "Into the Poppies",
 #        :artist => "John Wilhelm",
 #        :url    => "http://bitmakerlabs.s3.amazonaws.com/photogur/girl.jpg"
 #      }
 #    ]