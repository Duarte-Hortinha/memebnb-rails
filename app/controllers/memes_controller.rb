class MemesController < ApplicationController
  # before_action :set_list, only: [:show, :destroy]

  def index
    @memes = Meme.all
  end

  def show
    @meme = Meme.find(params[:id])
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = Meme.new(meme_params)
    @meme.user = current_user
    if @meme.save
      redirect_to meme_path(@meme)  # correct, goes to show page but @meme has to yield ID
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @meme.destroy
    redirect_to memes_path, status: :see_other # correct, goes back to index
  end

  private

  # def set_list
  #   @list = List.find(params[:id])
  # end

  def meme_params
    params.require(:meme).permit(:price, :description, :photo) # added photo because of cloudinary
  end
end
