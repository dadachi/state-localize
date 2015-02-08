json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :country_id, :state_id
  json.url shop_url(shop, format: :json)
end
