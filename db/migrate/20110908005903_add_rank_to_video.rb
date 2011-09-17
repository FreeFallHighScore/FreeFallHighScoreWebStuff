class AddRankToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :rank, :integer
  end

  def self.down
    remove_column :videos, :rank
  end
end
