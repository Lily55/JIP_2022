class Post < ApplicationRecord
    include ActionView::Helpers::TextHelper
    include Authorship
    validates_uniqueness_of :title
    validates :title, :summary, :body, :forwhom, presence: true
    validates :title, length: { maximum: 140}

    belongs_to :user



    def formatted_description
        return simple_format(self.body)
    end


end
