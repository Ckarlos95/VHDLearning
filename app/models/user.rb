class User < ActiveRecord::Base
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

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
