FactoryBot.define do
  factory :endpoint, class: Endpoint do
    name      { 'test endpoint' }
    responses { [{ code: 200 }, { code: 500 }] }
  end
end
