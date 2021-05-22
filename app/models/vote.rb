class Vote < ApplicationRecord
    belongs_to :user
    belongs_to :poll_item
end
