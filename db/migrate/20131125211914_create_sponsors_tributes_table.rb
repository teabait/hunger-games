class CreateSponsorsTributesTable < ActiveRecord::Migration
  def change
    create_table :sponsors_tributes do |t|
      t.belongs_to :sponsor
      t.belongs_to :tribute
    end
  end
end
