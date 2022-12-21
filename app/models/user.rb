class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :username, :email
    validates :username, :email, :password, presence: true
    validates :username, format: { with: /\A\w+\s?\w+\z/, message: 'Имя пользователя не должно иметь пробелов на конце, а также других знаков по типу: "+", "-" и тд.'}
    validates :email, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/, message: 'Почта должна содержать @ и домен'}

    has_many :posts
end
