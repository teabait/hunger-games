class AddReferenceToCitizen < ActiveRecord::Migration
  def change
    add_reference :citizens, :district, index: true
  end
end
