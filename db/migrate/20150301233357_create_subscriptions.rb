class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :customer_id
      t.integer :channel_id

      t.timestamps null: false
    end
  end
end
