class CreateSubscribemMembers < ActiveRecord::Migration
  def change
    create_table :subscribem_members do |t|
      t.integer :account_id
      t.integer :user_id

      t.timestamps
    end
    add_index :subscribem_members, :account_id
    add_index :subscribem_members, :user_id
  end
end
