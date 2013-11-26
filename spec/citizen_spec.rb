require 'spec_helper'

describe Citizen do
  let(:citizen) {Citizen.new(name: "REILLY JOBS", sex: "F", age: 13, district_id: 1)}

  describe "validations" do
    it { should validate_presence_of(:district_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:sex) }
    it { should validate_presence_of(:age) }
  end
end