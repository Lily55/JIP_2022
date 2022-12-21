class Post < ApplicationRecord
    validates_uniqueness_of :title
    validates :title, :summary, :body, presence: true
    validates :title, length: { maximum: 140}

    belongs_to :user
end
