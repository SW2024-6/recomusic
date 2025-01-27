class MusicsController < ApplicationController
    def index
        if (params[:difficulty])
            @musics = Music.where(difficulty: params[:difficulty].to_i)
        else
            @musics = Music.all
        end
    end
  
    def new
        @music = Music.new
    end
    
    def create
        m = Music.new(  title: params[:music][:title], 
                        artist: params[:music][:artist],
                        difficulty: params[:music][:difficulty],
                        genre: params[:music][:genre])
        m.save
        redirect_to musics_path
    end

    def show
        @music = Music.find(params[:id])
        @comments = @music.comments
        @link = @music.link
    end
    
    def destroy
        music = Music.find(params[:id])
        difficulty = music.difficulty
        music.destroy
        redirect_to musics_path(difficulty: difficulty)
    end
end
