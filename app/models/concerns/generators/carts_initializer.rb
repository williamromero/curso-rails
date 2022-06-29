module Generators
  module CartsInitializer
    def cart_creation_setup
      resource = ShoppingCart.new active: true, total: 0, uuid: SecureRandom.uuid
      resource.save
      resource
    end
  end
end
