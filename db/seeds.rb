100.times do
  Rails.logger.debug "Creating products...\r"
  Product.create(
    name: Faker::Commerce.product_name,
    code: "P0#{Time.zone.now.strftime('%d%m%y')}#{Random.rand(1..100000)}",
    description: Faker::Lorem.paragraph,
    uuid: SecureRandom.uuid,
    stock: Random.rand(1..50),
    price: Random.rand(1..5000)
  )
end

15.times do
  Rails.logger.debug "Creating users...\r"
  User.create(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(
      min_length: 10,
      max_length: 20,
      mix_case: true,
      special_characters: true
    )
  )
end
# https://rubydoc.info/github/faker-ruby/faker/master/Faker%2FInternet.password
