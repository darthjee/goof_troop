# frozen_string_literal: true

class Response
  include Mongoid::Document
  field :code, type: Integer
end
