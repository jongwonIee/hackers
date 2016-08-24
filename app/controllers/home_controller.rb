class HomeController < ApplicationController
  def index
    @hackers = Hacker.all
  end
  
end
