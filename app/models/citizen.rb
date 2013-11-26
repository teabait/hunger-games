class Citizen < ActiveRecord::Base
  validates :district_id, :name, :sex, :age, presence: true
end