require 'spec_helper'

describe Game do
  let(:game) { Game.create(number: 1) }

  describe '::new' do
    it 'creates a game without a problem' do
      expect(game).to have(0).errors
    end

    it 'has a number to identify it with' do
      expect(game.number).to eq(1)
    end
  end
  describe '#reap' do
    context 'the reaping' do
      before do
        citizen1 = Citizen.create(name: "Aaron", age: 17, sex: "M", district_id: 1)
        citizen2 = Citizen.create(name: "Tara", age: 13, sex: "F", district_id: 1)
        citizen1 = Citizen.create(name: "Remus", age: 12, sex: "M", district_id: 1)
        citizen2 = Citizen.create(name: "Thor", age: 16, sex: "F", district_id: 1)
      end
      it 'selects a tribute' do
        game.reap
        expect((Tribute.all).count).to eq(1)
      end
    end
  end
end