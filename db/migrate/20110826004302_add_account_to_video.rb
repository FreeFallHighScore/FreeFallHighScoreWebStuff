class AddAccountToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :account, :string
  end

  def self.down
    remove_column :videos, :account
  end
end
