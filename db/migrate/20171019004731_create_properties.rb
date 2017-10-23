class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
