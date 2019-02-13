class User < ApplicationRecord

  validates :first_name, presence: true, format: {with: /\A[a-zA-Z0-9 _\.]*\z/} 
  validates :last_name, presence: true, format: {with: /\A[a-zA-Z0-9 _\.]*\z/} 
  
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable
  devise :omniauthable, omniauth_providers: [:facebook]

  def self.from_facebook(auth)
  	where(facebook_id: auth.uid).first_or_create do |user|
  	  user.email = auth.info.email
  	  user.first_name = auth.info.first_name
  	  user.last_name = auth.info.last_name
  	  user.password = Devise.friendly_token[0, 20]
  	  user.skip_confirmation!
  	  user.save
  	end   
  end


  has_many :dormitory_beds 
  has_many :sleeping_rooms
  has_many :orders
  has_many :hosteds

end
