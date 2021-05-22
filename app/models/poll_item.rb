class PollItem < ApplicationRecord
  belongs_to :poll

  has_one_attached :image

  has_many :votes, dependent: :destroy
end
