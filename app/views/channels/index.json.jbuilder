json.array!(@channels) do |channel|
  json.extract! channel, :id, :name
  json.url channel_url(channel, format: :json)
  json.rewards channel.rewards
end
