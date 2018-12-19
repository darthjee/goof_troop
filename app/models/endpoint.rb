module Mongoid
  class Collection
    attr_reader :elements

    def initialize(elements)
      @elements = elements.map do |element|
        self.class.instance_klass.new(element)
      end
    end

    def mongoize
      elements.map(&:mongoize)
    end

    def as_json(options = nil)
      elements.map do |element|
        elements.as_json(options)
      end
    end

    def to_json(options=nil)
      as_json(options).to_json
    end

    class << self
      attr_accessor :instance_klass

      def of(klass)
        Class.new(Mongoid::Collection).tap do |collection_class|
          collection_class.instance_klass = klass
        end
      end

      def demongoize(attributes)
        new(attributes)
      end

      def mongoize(object)
        case object
        when self then object.mongoize
        when Hash then self.new(object).mongoize
        else object
        end
      end

      def evolve(object)
        case object
        when self then object.mongoize
        else object
        end
      end
    end
  end
end

class Endpoint
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  has_many :responses
  #field :responses, type: Mongoid::Collection.of(Response)
end

