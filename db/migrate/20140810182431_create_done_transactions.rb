class CreateDoneTransactions < ActiveRecord::Migration
  def change
    create_table :done_transactions do |t|

      t.integer :property_id
      t.integer :client_id
      t.integer :transaction_type

      t.float :transaction_price
      t.date :transaction_date
      t.date :transaction_end_date

      t.timestamps
    end
  end
end
