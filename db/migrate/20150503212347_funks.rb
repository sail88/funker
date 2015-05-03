class Funks < ActiveRecord::Migration
  def change
  	change_table :funks do |t|
		t.decimal  "latitude", :precision => 15, :scale => 10, :default => 0.0
  		t.decimal  "longitude", :precision => 15, :scale => 10, :default => 0.0
  	end
  end
end
