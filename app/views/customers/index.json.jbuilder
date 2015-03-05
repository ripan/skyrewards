json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :account_number
  json.url customer_url(customer, format: :json)
  json.channels customer.channels
end
