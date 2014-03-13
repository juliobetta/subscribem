class AddOwnerIdToSubscribemAccounts < ActiveRecord::Migration
  def change
    add_column :subscribem_accounts, :owner_id, :integer
    add_index :subscribem_accounts, :owner_id
  end
end
