class AddViewKeyToShare < ActiveRecord::Migration
  def change
    add_column :shares, :view_key, :string
  end
end
