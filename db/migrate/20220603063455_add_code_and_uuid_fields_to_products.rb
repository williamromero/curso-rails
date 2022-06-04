class AddCodeAndUuidFieldsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :code, :string, after: :id
    add_column :products, :uuid, :text, after: :name
  end
end
