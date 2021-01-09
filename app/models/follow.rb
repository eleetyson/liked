class Follow < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :name, presence: true
  validates :handle, presence: true

end
