class ArtistsController < ApplicationController
    
before_action :authenticate_user! , only: [:new,:show]
before_action :find_Artist, except: [:index, :new, :create]
  
  
  def index
        @artists = Artist.all 
    end	
    
    def show
        @artist = Artist.find(params[:id])
        if @artist.user != current_user
          flash[:notice] = 'Not allowed!'
          redirect_to artists_path
        end
        @songs = @artist.songs
      end

      def new
        @artist = Artist.new
      end

      def create
        Artist.create(params.require(:artist).permit(:name, :albums, :hometown, :img))
        redirect_to artists_path
      end


      def edit
        @artist = Artist.find(params[:id])
      end


      def update
        artist = Artist.find(params[:id])
        artist.update(todo_paramse)
        
        redirect_to artist
      end

      def destroy
        Artist.find(params[:id]).destroy
      
        redirect_to artists_path
      end



      private 
def  todo_paramse
 params.require(:artist).permit(:name, :albums, :hometown, :img)
end

def find_Artist
  @artist = Artist.find(params[:id])
end


end