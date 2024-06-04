class MemesController < ApplicationController
  # before_action :set_list, only: [:show, :destroy]
  before_action :authenticate_user!, only: :update

  def index
    @memes = Meme.all
    if params[:query].present?
      @memes = @memes.search_by_title(params[:query])
    end

  end

  def show
    @meme = Meme.find(params[:id])
    @booking = Booking.new
  end

  def new
    if current_user.nil?
      redirect_to new_user_session_path, notice: "You are not logged in!"
    end
    @meme = Meme.new
  end

  def create
    @meme = Meme.new(meme_params)
    @meme.user = current_user
    if @meme.save
      redirect_to meme_path(@meme) # correct, goes to show page but @meme has to yield ID
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
    @meme = Meme.find(params[:id])
  end

  def update
    @user = current_user
    @meme = @user.meme.find(params[:id])
    if @meme.update_attributes(meme_params)
      flash[:success] = "Meme updated!"
      redirect_to user_memes_path(current_user)
    else
      render action: :edit
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
    params.require(:meme).permit(:price, :description, :photo, :title) # added photo because of cloudinary
  end
end
