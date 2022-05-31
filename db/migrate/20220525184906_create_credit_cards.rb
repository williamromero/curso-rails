class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.string :no_card
      t.string :owner
      t.string :provider

      t.timestamps
    end
  end
end
