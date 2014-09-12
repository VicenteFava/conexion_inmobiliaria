class AddTypeToPropertyTypes < ActiveRecord::Migration
  def change
    add_column :property_types, :category, :string
  end
end
