class AddTypeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_type, :integer, default: 0, null: false
  end
end
