class Game < ActiveRecord::Base
  def reap
    i = 1
    while i < 5
      2.times do
        # i swear the sex M worked before but now it didn't and i am tired
        tribute = Citizen.where(district_id: i and sex: "M").sample
        unless tribute.age > 18 || tribute.age < 12
          Tribute.create(citizen_id: tribute.id, district_id: tribute.district_id)
        end
      end
      i += 1
    end
  end
end
