class CreateTributes < ActiveRecord::Migration
  def change
    create_table :tributes do |t|
      t.integer :rating
      t.boolean :alive, default: true
      t.belongs_to :citizen
      t.belongs_to :game
    end
  end
end
