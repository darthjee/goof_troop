class Response
  include SafeAttributeAssignment
  attr_accessor :code

  def initialize(attributes = {})
    assign_attributes(attributes)
  end

  def mongoize
    {
      code: code
    }
  end

  class << self
    def demongoize(attributes)
      case attributes
      when Array
        attributes.map { |res| demongoize(res) }
      else new(attributes)
      end
    end

    def mongoize(object)
      case object
      when Response then object.mongoize
      when Hash then Response.new(object).mongoize
      else object
      end
    end

    def evolve(object)
      case object
      when Response then object.mongoize
      else object
      end
    end
  end
end
