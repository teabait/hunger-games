class Game < ActiveRecord::Base
  def reap
    i = 1
    while i < 4
      2.times do
        tribute = Citizen.where(district_id: i).sample
        Tribute.create(citizen_id: tribute.id, district_id: tribute.district_id)
      end
      i += 1
    end
  end
end
