require 'faker'

class User < ApplicationRecord
    has_secure_password
    validates :password, length: {minimum: 6}
    validates_uniqueness_of :username, :email
    validates :username, :email, :password, presence: true
    validates :username, format: { with: /\A\w+\s?\w+\z/, message: 'Имя пользователя не должно иметь пробелов на конце, а также других знаков по типу: "+", "-" и тд.'}
    validates :email, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/, message: 'Почта должна содержать @ и домен'}

    has_many :posts

    attr_accessor :password_reset_token, :password_reset_token_sent_at

    def set_password_reset_token
        update password_reset_token: "#{Faker::Lorem.characters(number: 10)}"
    end

    def password_reset_period_valid?
        
        # flash[:warning] = "password_reset_token_sent_at не существует" unless password_reset_token.present?
        email.present?
    end

    def new_token
        SecureRandom.urlsafe_base64
    end

    def digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

end
