class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: :home

  def home
    @memes = Meme.all.sample(4)
    # alterarion
  end

end
