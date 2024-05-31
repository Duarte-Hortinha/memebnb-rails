class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: :home

  def home
    @memes = Meme.all.sample(3)
  end
  def mybooking
    @pendingbookings = Booking.where(user: current_user, confirmed: false)
    @confirmedbookings = Booking.where(user: current_user, confirmed: true)
  end
  def myself

  end

end
