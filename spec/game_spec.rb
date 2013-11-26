require 'spec_helper'

describe Game do
  let(:game) { Game.create(number: 1) }
  context 'citizens are in the database' do
    before do
      citizen1 = Citizen.create(name: "Aaron", age: 17, sex: "M", district_id: 1)
      citizen2 = Citizen.create(name: "Tara", age: 13, sex: "F", district_id: 1)
      citizen1 = Citizen.create(name: "Remus", age: 12, sex: "M", district_id: 1)
      citizen2 = Citizen.create(name: "Thor", age: 16, sex: "F", district_id: 1)
      citizen1 = Citizen.create(name: "Rumer", age: 17, sex: "M", district_id: 2)
      citizen2 = Citizen.create(name: "Zola", age: 13, sex: "F", district_id: 2)
      citizen1 = Citizen.create(name: "Sage", age: 12, sex: "M", district_id: 2)
      citizen2 = Citizen.create(name: "Wash", age: 16, sex: "F", district_id: 2)
    end
    describe '::new' do
      it 'creates a game without a problem' do
        expect(game).to have(0).errors
      end
      it 'has a number to identify it with' do
        expect(game.number).to eq(1)
      end
      it 'has citizens' do
        expect((Citizen.all).count).to eq(8)
      end

      describe '#reap' do
        context 'the reaping' do
          it 'selects a tribute' do
            game.reap
            expect((Tribute.all).count).to eq(4)
          end
          it 'selects two tribute from each district' do
            # I did .first and because that works, i assume .random works, too.
            game.reap
            expect(Tribute.where(district_id: 1).count).to eq(2)
            expect(Tribute.where(district_id: 2).count).to eq(2)
          end
        end
      end
    end
  end
end