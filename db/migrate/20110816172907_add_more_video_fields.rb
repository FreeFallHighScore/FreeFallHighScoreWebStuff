class AddMoreVideoFields < ActiveRecord::Migration
  def self.up
    add_column :videos, :latitude,  :string
    add_column :videos, :longitude, :string
    add_column :videos, :make,      :string
    add_column :videos, :system,    :string
    add_column :videos, :version,   :string
    remove_column :videos, :device
    remove_column :videos, :location
  end

  def self.down
    remove_column :videos, :location
    remove_column :videos, :device
    add_column :videos, :version,   :string
    add_column :videos, :system,    :string
    add_column :videos, :make,      :string
    add_column :videos, :longitude, :string
    add_column :videos, :latitude,  :string
  end
end
