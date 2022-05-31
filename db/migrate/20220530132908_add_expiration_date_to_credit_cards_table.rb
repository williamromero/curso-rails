class AddExpirationDateToCreditCardsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :credit_cards, :expiration_date, :string, after: :no_card, null: false, default: ''
  end
end
