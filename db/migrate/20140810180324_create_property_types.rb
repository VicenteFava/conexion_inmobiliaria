class CreatePropertyTypes < ActiveRecord::Migration
  def change
    create_table :property_types do |t|

      t.string :name
      t.integer :properties_count, default: 0

      t.timestamps
    end
  end
end
