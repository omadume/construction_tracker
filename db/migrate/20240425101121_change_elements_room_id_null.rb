class ChangeElementsRoomIdNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :elements, :room_id, true
  end
end
