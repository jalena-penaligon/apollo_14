class AstronautsController < ApplicationController

  def index
    @astronauts = Astronaut.all
    @average_age = Astronaut.average_age
    @missions = Mission.all
    @time_in_space = Mission.total_time
  end

end
