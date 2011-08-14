class AddMoreDataToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :author,      :string
    add_column :videos, :location,    :string
    add_column :videos, :drop_time,   :integer
    add_column :videos, :device,      :string
    add_column :videos, :title,       :string
    add_column :videos, :description, :text
    add_index :videos, :youtube_id, :unique => true
    add_index :videos, :author, :unique => false
  end

  def self.down
    remove_index :videos, :author
    remove_index :videos, :youtube_id
    remove_column :videos, :description
    remove_column :videos, :title
    remove_column :videos, :device
    remove_column :videos, :drop_time
    remove_column :videos, :location
    remove_column :videos, :author
  end
end
