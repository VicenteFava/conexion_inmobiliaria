class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|

      t.string :name
      t.string :phone
      t.string :celluar
      t.string :optional_phone
      t.string :email

      t.timestamps
    end
  end
end
