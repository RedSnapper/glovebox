class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.references :share
      t.string :name

      t.timestamps
    end
  end
end
