class User < ApplicationRecord
  has_many :follows
  validates :name, presence: true
  validates :handle, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true
  validates :secret, presence: true, uniqueness: true

# finds existing user or creates new user based on Twitter API response
  def self.from_omniauth(auth)
    self.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth[:info][:name]
      u.handle = auth[:info][:nickname]
      u.token = auth[:credentials][:token]
      u.secret = auth[:credentials][:secret]
    end
  end

end
