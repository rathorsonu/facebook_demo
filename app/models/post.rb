class Post < ApplicationRecord
	belongs_to :user
    has_many :comments
    has_many :likes, :as => :likeable

    has_one_attached :image
    validates :title , :description , presence: true

end
