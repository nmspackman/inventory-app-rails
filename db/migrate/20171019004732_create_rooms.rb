class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.references :property, foreign_key: true
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
