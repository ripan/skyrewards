class CreateChannelRewards < ActiveRecord::Migration
  def change
    create_table :channel_rewards do |t|
      t.integer :channel_id
      t.integer :reward_id

      t.timestamps null: false
    end
  end
end
