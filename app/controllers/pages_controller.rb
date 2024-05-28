class PagesController < ApplicationController

  def home
    @memes = Meme.first(4)
  end

end
