class AddLocationToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :city, :string
    add_column :videos, :state, :string
    add_column :videos, :country, :string
  end

  def self.down
    remove_column :videos, :city, :string
    remove_column :videos, :state, :string
    remove_column :videos, :country, :string
  end
end
