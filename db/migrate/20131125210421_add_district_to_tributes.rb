class AddDistrictToTributes < ActiveRecord::Migration
  def change
    add_reference :tributes, :district, index: true
  end
end
