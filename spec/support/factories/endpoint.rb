FactoryBot.define do
  factory :endpoint, class: Endpoint do
    name      { 'test endpoint' }
    responses { [1, 2] }
  end
end
