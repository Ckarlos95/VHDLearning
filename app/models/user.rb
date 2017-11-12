class User < ActiveRecord::Base
  validates_presence_of :name
  validates :nickname, uniqueness: true, presence: true

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable

  def self.create_from_omniauth(params)
    nickname = create_unique_nickname(params['info'])
    attributes = {
      name: params['info']['name'],
      email: params['info']['email'],
      password: Devise.friendly_token,
      nickname: nickname,
      image: params['info']['image'],
      confirmed_at: Time.now.utc
    }
    create(attributes)
  end

  private

  def self.create_unique_nickname(params_info, separator:'_', post_len:4)
    nickname = params_info['nickname'] || params_info['name']
    nickname = nick_bckp = nickname.split.first

    until User.find_by_nickname(nickname).blank?
      nickname = nick_bckp + separator + [*('a'..'z'),*('0'..'9')].shuffle[0, post_len].join
    end

    nickname
  end
end