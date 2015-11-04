class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :deafult => "wavatar"
  has_many :events
  has_many :hangouts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, format: { with: /\w+\@\w+\.edu\.?\w*/,
    message: "Please use your .edu email" }
end
