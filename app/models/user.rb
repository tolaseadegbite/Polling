class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :polls, dependent: :destroy

  has_many :votes, dependent: :destroy

  def votes?(poll_item)
    poll_item.votes.where(user_id: id).any?
  end

end
