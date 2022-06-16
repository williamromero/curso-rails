
100.times {
  Product.create(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph,
    code: "P#{Time.now.strftime("%y%m%d")}#{Random.rand(1..100000).to_s}",
    stock: Random.rand(1..50),
    price: Random.rand(1..5000),
    uuid: SecureRandom.uuid
  )
}
