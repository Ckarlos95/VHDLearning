class User < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :nickname

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable


  def self.create_from_omniauth(params)
    attributes = {
      name: params['info']['name'],
      email: params['info']['email'],
      password: Devise.friendly_token,
      nickname: params['info']['nickname'],
      image: params['info']['image'],
      confirmed_at: Time.now.utc
    }
    create(attributes)
  end
end