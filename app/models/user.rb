class User < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :username
  validates :username, presence: true
  validates :username, format: { with: /\A\w+\s?\w+\z/, message: 'Имя пользователя не должно иметь пробелов на конце, а также других знаков по типу: "+", "-" и тд.'}
end
