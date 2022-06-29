module ProductsHelper
  def reduced_text(text)
    truncate(text, length: 50)
  end

  def reduced_price(price)
    number_to_currency(price, unit: 'Q. ', separator: '.', delimiter: ',')
  end

  def fixed_date_format(date)
    date.strftime('%d/%m/%Y')
  end
end
