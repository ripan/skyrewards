class Reward < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :channel_rewards
  has_many :channels, through: :channel_rewards
end
