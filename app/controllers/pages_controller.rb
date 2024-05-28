class PagesController < ApplicationController

  def home
    @memes = Meme.all.sample(4)
  end

end
