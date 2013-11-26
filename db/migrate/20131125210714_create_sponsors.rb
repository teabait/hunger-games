class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.belongs_to :citizen
    end
  end
end
