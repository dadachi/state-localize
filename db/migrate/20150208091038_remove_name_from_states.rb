class RemoveNameFromStates < ActiveRecord::Migration
  def change
  	remove_column :states, :name
  end
end
