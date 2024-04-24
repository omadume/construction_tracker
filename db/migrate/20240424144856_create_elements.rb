class CreateElements < ActiveRecord::Migration[7.1]
  def change
    create_table :elements do |t|
      t.references :room, null: false, foreign_key: true
      t.string :name
      t.decimal :cost

      t.timestamps
    end
  end
end
