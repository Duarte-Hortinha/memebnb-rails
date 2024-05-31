class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: :home

  def home
    @memes = Meme.all.sample(3)
  end
  def mybooking
    @confirmedbookings = Booking.where(user: current_user, confirmed: true)
    @pendingbookings = Booking.where(user: current_user, confirmed: false)
  end
  def myself

  end

end
