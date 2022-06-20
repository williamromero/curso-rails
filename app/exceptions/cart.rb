require "active_support/concern"

module Cart
  class Error < StandardError
    def initialize(message = nil)
      super(message)
    end
  end
end
