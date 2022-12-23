require 'faker'

class User < ApplicationRecord
    enum role: { basic: 0, full: 2, admin: 1, baby: 3, observer: 4 }, _suffix: :role

    has_secure_password
    validates :password, length: {minimum: 6}
    validates_uniqueness_of :username, :email
    validates :username, :email, :password, presence: true
    validates :username, format: { with: /\A\w+\s?\w+\z/, message: 'Имя пользователя не должно иметь пробелов на конце, а также других знаков по типу: "+", "-" и тд.'}
    validates :email, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/, message: 'Почта должна содержать @ и домен'}

    has_many :posts

    def author?(obj)
        obj.user = self
    end

    def admin_role?
        self.role == 1
    end

    def full_role?
        self.role == 2
    end

    def baby_role?
        self.role == 3
    end

    def observer_role?
        self.role == 4
    end

    def remember_me
        token = SecureRandom.urlsafe_base64
        update_column :remember_token_digest, digest(token)
    end

    def remember_token_authenticated?(remember_token)
        BCrypt::Password.new(remember_token_digest).is_password?(remember_token)
    end

    def set_password_reset_token
        update_column :password_reset_token_digest, digest(SecureRandom.urlsafe_base64)
        update_column :password_reset_token_sent_at_digest, Time.current
    end

    def password_reset_period_valid?
        
        # flash[:warning] = "password_reset_token_sent_at не существует" unless password_reset_token.present?
        password_reset_token_sent_at_digest.present? && Time.now - password_reset_token_sent_at_digest <= 60.minutes
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
