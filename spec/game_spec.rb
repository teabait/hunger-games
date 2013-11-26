require 'spec_helper'

describe Game do
  let(:game) { Game.create(number: 1) }
  context 'citizens are in the database' do
    before do
      Citizen.create(name: "Aaron", age: 17, sex: "M", district_id: 1)
      Citizen.create(name: "Tara", age: 13, sex: "F", district_id: 1)
      Citizen.create(name: "Remus", age: 12, sex: "M", district_id: 1)
      Citizen.create(name: "Thor", age: 16, sex: "F", district_id: 1)
      Citizen.create(name: "Rover", age: 17, sex: "M", district_id: 1)
      Citizen.create(name: "Grover", age: 13, sex: "F", district_id: 1)
      Citizen.create(name: "Dumont", age: 12, sex: "M", district_id: 1)
      Citizen.create(name: "Liann", age: 16, sex: "F", district_id: 1)
      Citizen.create(name: "Rumer", age: 17, sex: "M", district_id: 2)
      Citizen.create(name: "Zola", age: 13, sex: "F", district_id: 2)
      Citizen.create(name: "Sage", age: 12, sex: "M", district_id: 2)
      Citizen.create(name: "Wash", age: 16, sex: "F", district_id: 2)
      Citizen.create(name: "Monty", age: 17, sex: "M", district_id: 3)
      Citizen.create(name: "Ordon", age: 13, sex: "F", district_id: 3)
      Citizen.create(name: "Noodle", age: 13, sex: "M", district_id: 3)
      Citizen.create(name: "Triash", age: 16, sex: "F", district_id: 3)
      Citizen.create(name: "Brack", age: 10, sex: "M", district_id: 4)
      Citizen.create(name: "Florence", age: 36, sex: "F", district_id: 4)
    end
    describe '::new' do
      it 'creates a game without a problem' do
        expect(game).to have(0).errors
      end
      it 'has a number to identify it with' do
        expect(game.number).to eq(1)
      end
      it 'has citizens' do
        expect((Citizen.all).count).to eq(18)
      end

      describe '#reap' do
        context 'the reaping' do
          it 'selects a tribute' do
            game.reap
            expect((Tribute.all).count).to eq(6)
          end
          it 'selects two tribute from each district' do
            # I did .first and because that works, i assume .random works, too.
            game.reap
            expect(Tribute.where(district_id: 1).count).to eq(2)
            expect(Tribute.where(district_id: 2).count).to eq(2)
            expect(Tribute.where(district_id: 3).count).to eq(2)
          end
          it 'does not select people outside of the age range 12-18' do
            game.reap
            expect(Tribute.where(district_id: 4).count).to eq(0)
          end
          it 'selects tributes by sex' do
            females = []
            Tribute.all.each do |trib|
              if trib.citizen.sex == "F"
                females << trib
              end
            end
            expect(females.count).to eq(0)
          end
        end
      end
    end
  end
end