class ChannelReward < ActiveRecord::Base
	belongs_to :channel
	belongs_to :reward
end
