class CommentsController < ApplicationController
  def new
    @music_id = params[:music_id]
    @comment = Comment.new
  end

  def create
    music_id = params[:comment][:music_id]
    @comment = Comment.new( title: params[:comment][:title], 
                            body: params[:comment][:body],
                            my_difficulty: params[:comment][:my_difficulty],
                            music_id: music_id)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to music_path(music_id)
  end

  def show
  end

end
