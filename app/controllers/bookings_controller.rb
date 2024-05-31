class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @meme = Meme.find(params[:meme_id])
    @booking = Booking.new(booking_params)
    @booking.meme = @meme
    @booking.user = current_user
    if @booking.save
      redirect_to mybookings_path  # correct, goes to show page but @meme has to yield ID
    else
      render "memes/show", status: :unprocessable_entity
      flash[:alert] = "Booking unsuccessful, please try again!"
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other # correct, goes back to index
  end

  private

  # def set_list
  #   @list = List.find(params[:id])
  # end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date) # added photo because of cloudinary
  end
end
