class PagesController < ApplicationController
  
  # skip_before_action :authenticate_user!, only: :home

  def home
    @memes = Meme.first(4)
  end

end
