class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.references :country, index: true
      t.references :state, index: true

      t.timestamps null: false
    end
    add_foreign_key :shops, :countries
    add_foreign_key :shops, :states
  end
end
