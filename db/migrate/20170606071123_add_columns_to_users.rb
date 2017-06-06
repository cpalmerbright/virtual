class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :included_transactions, :integer, default: 0
    add_column :users, :paid_transactions, :integer, default: 0
  end
end
