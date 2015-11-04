class Event < ActiveRecord::Base
  belongs_to :user
  has_many :hangouts
  has_many :users, through: :hangouts
end
