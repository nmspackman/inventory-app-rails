class CreateUserProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :user_properties do |t|
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
