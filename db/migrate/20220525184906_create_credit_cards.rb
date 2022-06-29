class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.string :owner
      t.string :provider
      t.string :no_card, default: ''
      t.string :expiration_date, default: ''

      t.timestamps
    end
  end
end
