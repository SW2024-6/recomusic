class MusicController < ApplicationController
  def list
    @musics = Music.all
  end

  def show
    
  end
end
