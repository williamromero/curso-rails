class ProductValidator < ActiveModel::Validator

  def validate(record)
    validate_stock(record)
  end

  def validate_stock(record)
    record.errors.add :stock, message: "El campo stock debe ser tener un valor mayor que 0" unless record.stock > 0
  end

end
