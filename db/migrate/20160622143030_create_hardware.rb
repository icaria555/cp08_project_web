class CreateHardware < ActiveRecord::Migration[5.0]
  def change
    create_table :hardwares do |t|
      t.string :name
      t.integer :owner_id
      t.timestamps
    end
  end
end
