class Channel < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  has_many :subscriptions
  has_many :customers, through: :subscriptions

  has_many :channel_rewards
  has_many :rewards, through: :channel_rewards
end
