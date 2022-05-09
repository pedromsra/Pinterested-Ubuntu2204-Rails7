class Like < ApplicationRecord
  validates :user_id, uniqueness: {scope: :pin_id}
  belongs_to :user
  belongs_to :pin
end
