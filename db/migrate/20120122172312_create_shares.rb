class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :email
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
