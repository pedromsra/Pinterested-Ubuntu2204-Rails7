class Pin < ApplicationRecord
    belongs_to :user
    has_many :likes, :dependent => :delete_all 
end
