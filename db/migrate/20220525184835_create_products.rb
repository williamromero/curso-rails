class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string  :code
      t.string  :name
      t.text    :uuid
      t.string  :description
      t.integer :stock
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
