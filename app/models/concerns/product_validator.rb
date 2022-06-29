class ProductValidator < ActiveModel::Validator
  def validate(record)
    validate_stock(record)
  end

  def validate_stock(record)
    unless record.stock.positive?
      record.errors.add :stock,
                        message: 'El campo stock debe ser tener un valor mayor que 0'
    end
  end
end
