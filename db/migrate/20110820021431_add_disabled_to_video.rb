class AddDisabledToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :disabled, :boolean, :default => false
  end

  def self.down
    remove_column :videos, :disabled
  end
end
