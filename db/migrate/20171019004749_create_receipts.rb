class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.references :property, foreign_key: true
      t.string :company
      t.string :company_location
      t.string :image
      t.timestamps
    end
  end
end
