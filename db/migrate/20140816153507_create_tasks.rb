class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

    	t.integer :client_id
    	t.integer :admin_user_id
    	
    	t.text :task

      t.timestamps
    end
  end
end
