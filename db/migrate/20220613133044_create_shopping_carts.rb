class CreateShoppingCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_carts do |t|
      t.decimal    :total, precision: 10, scale: 2, default: 0
      t.references :user, null: false, foreign_key: true
      t.boolean    :active, default: false, null: false

      t.timestamps
    end
  end
end
