class ChangeRelation < ActiveRecord::Migration
  def up
    drop_table :users
    drop_table :healths
  end

  def down
  end
  def change
    drop_table :users
    drop_table :healths
  end
end
