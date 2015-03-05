json.array!(@rewards) do |reward|
  json.extract! reward, :id, :name
  json.url reward_url(reward, format: :json)
  json.channels reward.channels
end
