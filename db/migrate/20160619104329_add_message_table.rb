class AddMessageTable < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.timestamps
    end
    
    create_table :messages do |t|
      t.belongs_to :conversation, index:true
      t.string :massages
      t.integer :read_unread
      t.datetime :time

      t.timestamps
    end
  end
end
