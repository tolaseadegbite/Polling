class Poll < ApplicationRecord
    belongs_to :user

    has_many :poll_items, dependent: :destroy

    accepts_nested_attributes_for :poll_items, reject_if: :all_blank, allow_destroy: true

    has_one_attached :image
    has_rich_text :description
end
