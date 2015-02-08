class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.references :country, index: true
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
