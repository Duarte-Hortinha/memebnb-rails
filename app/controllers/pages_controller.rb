class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: :home

  def home
    @memes = Meme.all.sample(3)
  end
  def mybooking
    @mybookings = Booking.where(user: current_user)
  end
  def myself

  end

end
