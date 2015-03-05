# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'skyrewards_extention'
customer_names = [
  'Merlene Drost',
  'Nancie Huffer',
  'Faith Reck',
  'Billi Neufeld',
  'Yolando Poindexter',
  'Sid Eurich',
  'Chantal Bockman',
  'Anitra Kindred',
  'Marcellus Bledsoe',
  'Chanelle Lay',
]
customer_names.each do |customer_name|
  Customer.create(name: customer_name, account_number: SkyrewardsExtention::AccountNUmber.get )
end


channels = %w(SPORTS KIDS MUSIC NEWS MOVIES)
channels.each do |channel|
  Channel.create(name: channel)
end


rewards = %w(CHAMPIONS_LEAGUE_FINAL_TICKET KARAOKE_PRO_MICROPHONE PIRATES_OF_THE_CARIBBEAN_COLLECTION)
rewards.each do |reward|
  Reward.create(name: reward)
end

sports_channel = Channel.find_by_name('SPORTS')
music_channel = Channel.find_by_name('MUSIC')
movies_channel = Channel.find_by_name('MOVIES')

reward_c = Reward.find_by_name('CHAMPIONS_LEAGUE_FINAL_TICKET')
reward_k = Reward.find_by_name('KARAOKE_PRO_MICROPHONE')
reward_p = Reward.find_by_name('PIRATES_OF_THE_CARIBBEAN_COLLECTION')


sports_channel.rewards << reward_c
music_channel.rewards << reward_k
movies_channel.rewards << reward_p

