class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence:true
    validates :body, presence:true
    has_many :images, as: :imageable
    enum status: {draft:0,published:1}
    scope :postman_post,->{ where(title:"Postman title")}
    class KuchTohError < StandardError 
    end

    def self.triggerException
        # raise KuchTohError 
    end
end
