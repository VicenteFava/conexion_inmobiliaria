class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|

    	t.integer :property_id
      t.integer :client_id
      t.integer :admin_user_id

      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
