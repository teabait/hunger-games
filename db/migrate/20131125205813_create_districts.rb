class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :number, null: false
    end
  end
end
