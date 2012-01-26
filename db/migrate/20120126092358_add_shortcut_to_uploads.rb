class AddShortcutToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :shortcut, :string
  end
end
