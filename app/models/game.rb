class Game < ActiveRecord::Base
  def reap
    tribute = (Citizen.all).sample
    Tribute.create(citizen_id: tribute.id)
  end
end