class RemoveAccountFromVideo < ActiveRecord::Migration
  def self.up
    remove_column :videos, :account
  end

  def self.down
    add_column :videos, :account, :string
  end
end
