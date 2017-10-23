class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :room, foreign_key: true
      t.string :name
      t.string :date
      t.float :price
      t.string :image
      t.timestamps
    end
  end
end
