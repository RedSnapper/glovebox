class AddAccessKeyToShare < ActiveRecord::Migration
  def change
    add_column :shares, :access_key, :string
  end
end
