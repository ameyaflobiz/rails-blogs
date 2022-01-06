class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence:true
    validates :body, presence:true
    has_many :images, as: :imageable
end
