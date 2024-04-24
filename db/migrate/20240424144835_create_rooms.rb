class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.references :building, null: false, foreign_key: true
      t.string :name
      t.decimal :cost

      t.timestamps
    end
  end
end
