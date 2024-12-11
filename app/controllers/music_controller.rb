class MusicController < ApplicationController
  def index
    @musics = Music.all
  end

end
