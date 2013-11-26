class Game < ActiveRecord::Base

  def reap
    i = 1
    # 5 in this case is the number of districts in my test data.
    while i < 5
      2.times do
        tribute = Citizen.where(district_id: i, sex: "M").sample
        # reaping only citizens 12-18
        unless tribute.age > 18 || tribute.age < 12
          Tribute.create(citizen_id: tribute.id, district_id: tribute.district_id)
        end
      end
      i += 1
    end
  end

end
