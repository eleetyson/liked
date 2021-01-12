class Follow < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :name, presence: true
  validates :handle, presence: true

# returns an account's uid attribute as an integer
  def get_uid_int
    self.uid.to_i
  end

# fetches and cleans an array of an account's recently favorited Tweets
# returns a randomly selected Tweet from that array, as an object
  def get_random_like(client)
    likes = client.favorites(self.get_uid_int, options = {count: 5})
    like = likes.sample
  end

end
