class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :sku
      t.integer :category

      t.timestamps null: false
    end
  end
end
