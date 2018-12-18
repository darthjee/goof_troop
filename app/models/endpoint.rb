class Endpoint
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :responses, type: Array
end

