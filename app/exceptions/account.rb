require 'active_support/concern'

module Account
  class Error < StandardError
    def initialize(message = nil)
      super(message)
    end
  end
end
