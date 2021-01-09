class Like < ApplicationRecord
  belongs_to :follow
  validates :tid, presence: true

# returns an tweet's tid attribute as an integer
  def get_tid_int
    self.tid.to_i
  end
end
