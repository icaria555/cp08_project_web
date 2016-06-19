class CreateTableAndRelation < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :uid
      t.string :user_class
      t.timestamps
    end
    
    create_table :healths do |t|
      t.belongs_to :user, index:true
      t.string :spo2
      t.string :h_rate
      t.string :h_signal
      t.datetime :check_date

      t.timestamps
    end
    
    create_table :relations do |t|
      t.belongs_to :user, index:true
      t.integer :patient_id
      t.timestamps
    end
  end
  
  def down
    drop_table :healths
    drop_table :users
    drop_table :relations
  end
end