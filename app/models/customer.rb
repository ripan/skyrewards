class Customer < ActiveRecord::Base
  validates :name, presence: true
  validates :account_number, presence: true, uniqueness: true
  has_many :subscriptions
  has_many :channels, through: :subscriptions
end
