class HomeController < ApplicationController
  def index
    
    @lecture = Lecture.all
  end
end
