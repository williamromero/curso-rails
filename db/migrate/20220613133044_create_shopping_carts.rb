class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.decimal    :total, precision: 10, scale: 2, default: 0
      t.boolean    :active, default: false, null: false
      t.references :user, null: true, foreign_key: true
      t.text       :uuid

      t.timestamps
    end
  end
end
