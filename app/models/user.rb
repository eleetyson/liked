class User < ApplicationRecord
  has_many :follows
  validates :name, presence: true
  validates :handle, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true
  validates :secret, presence: true, uniqueness: true

# returns a user's uid attribute as an integer
  def get_uid_int
    self.uid.to_i
  end

# fetches array of ids for user's Twitter follows and randomly selects one
# fetches and returns account info for the selected id, as an object
  def get_random_follow(client)
    follow_id = client.friend_ids(self.get_uid_int).attrs[:ids].sample
    follow = client.user(follow_id)
  end

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
