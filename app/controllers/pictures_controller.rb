class PicturesController < ApplicationController

 def index
    @most_recent_pictures = Picture.most_recent_five

    @pictures = Picture.all #.limit(5) .order(created_at: :desc).limit(5) .most_recent is a class method for query interface or .most_recent_five
     
  end

  def show
  	@picture = Picture.find(params[:id])

  end
	
  def new
  	@picture = Picture.new
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
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

  def destroy
      @picture = Picture.find(params[:id])
      @picture.destroy
      redirect_to pictures_url
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