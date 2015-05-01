class AddFKtoFunks < ActiveRecord::Migration
  def change
  	 change_table :funks do |t|
     	t.references :user
     end
  end
end
