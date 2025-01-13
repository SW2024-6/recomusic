class LinksController < ApplicationController
  def new
    @music_id = params[:music_id]
    @link = Link.new
  end

  def create
    music_id = params[:link][:music_id]
    @link = Link.new( video_url: params[:link][:video_url], 
                      score_url: params[:link][:score_url],
                      music_id: music_id)
    @link.save
    redirect_to music_path(music_id)
  end
end
