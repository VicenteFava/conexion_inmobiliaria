class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|

      t.string :reference

      t.boolean :for_sale
      t.boolean :for_rent
      t.boolean :for_season_rent
      t.boolean :for_permutation
      t.boolean :visible

      t.integer :client_id
      t.integer :property_type_id
      t.integer :neighborhood_id

      t.float :price
      t.text :description
      
      t.float :built_up
      t.float :lot_size
      t.integer :construction_year
      t.string :state
      
      t.boolean :living
      t.boolean :living_dining
      t.boolean :dining
      t.boolean :lounge
      t.boolean :desk
      t.boolean :kitchen
      t.boolean :kitchenette
      t.integer :suits
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :heating_type
      t.string :garage

      t.float :common_expenses
      t.integer :floor
      t.string :elevator
      t.string :porter
      t.string :recreational_areas

      t.timestamps
    end
  end
end
